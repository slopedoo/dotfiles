# Requires modules: requests
#                   argh
#                   soundcloud
#                   humanize

# pip2 install <MODULE>

# usage:
#   python2 scdl.py <URL>
#
# with either a playlist or individual songs

from __future__ import division
import os
import re
import time
import unicodedata

import requests
import argh
import humanize

from ID3 import *

class SoundCloudClient(object):

    def __init__(self, client_id):
        self.client_id = client_id

    def request(self, action, **params):
        params['client_id'] = self.client_id
        stream = params.pop('stream') if 'stream' in params else False

        if 'http' not in action:
            url = 'https://api.soundcloud.com/' + action + '.json'
        else:
            url = action

        return requests.get(url, verify=False, stream=stream, params=params)


def normalize(filename):
    '''Normalize the given name to make it a valid filename'''
    if isinstance(filename, unicode):
        filename = unicodedata.normalize('NFKD', filename)

    return re.sub(r'[\/\\\:\*\?\"\<\>\|]', '', filename)

def download_track(client, track, output_dir):
    title = normalize(track['title'])
    audio_track = os.path.join(output_dir, title) + '.' + track['original_format']

    if os.path.exists(audio_track):
        print u'Track "{}" already exists'.format(track['title'])
        return

    stream_url = track['stream_url']
    request = client.request(stream_url, stream=True)
    downloaded_track = u'{}.part'.format(audio_track)
    bytes_downloaded = os.stat(downloaded_track).st_size if os.path.exists(downloaded_track) else 0
    content_length = int(request.headers['content-length']) + bytes_downloaded

    CHUNK_SIZE = 100 * 1024
    time_before = time.time()
    with open(downloaded_track, 'wb') as f:
        for i, chunk in enumerate(request.iter_content(CHUNK_SIZE)):
            f.write(chunk)
            f.flush()

            now = time.time()
            try:
                download_speed = (CHUNK_SIZE)  / (now - time_before)
            except ZeroDivisionError:
                pass
            time_before = now

            if i % 2 == 0:
                print u'\rDownloading track {}, {:.1f}%, {}/s   '.format(
                                                                            track['title'],
                                                                            f.tell() * 100 / content_length,
                                                                            humanize.naturalsize(download_speed)),

    os.rename(downloaded_track, audio_track)

@argh.arg('-o', '--output-dir', help='Output directory')
def main(url, output_dir='/home/sigurd/Music', client_id='21956fd816a1dd6e40fe19508d5fa04b'):
    '''Download the given track/playlist'''
    client = SoundCloudClient(client_id)
    print u'Reading URL...'
    response = client.request('resolve', url=url).json()

    if 'tracks' in response: # a playlist
        print u'Playlist has {} tracks'.format(len(response['tracks']))

        title = response['title']
        title = normalize(title)

        output_dir = os.path.join(output_dir, title)
        if not os.path.exists(output_dir):
            os.makedirs(output_dir)

        for track in response['tracks']:
            download_track(client, track, output_dir=output_dir)

    else:
        download_track(client, response, output_dir=output_dir)


if __name__ == '__main__':
    argh.dispatch_command(main)
