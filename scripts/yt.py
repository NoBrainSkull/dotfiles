#href=\"(\/watch\?v=[a-zA-Z0-9-]+)
from pytube import YouTube

savePath = '/home/blue/Downloads/music/'
links = []
errors = []
looping = True

while looping:
  i = input('href?')
  if(i == ""):
    break
  else:
    links.append(i)

for l in links:
  try:
    yt = YouTube(l)
    video = yt.filter('mp4')[-1]
    print('[Downloading] ' + video.filename + '...')
    video.download(savePath)
    print('|> Downloaded.')
    print('')
  except:
    errors.append(l)
    print('[Error] - Error occured')

for e in errors:
  print(e)

print('done')