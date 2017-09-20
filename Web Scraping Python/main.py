import bs4, requests

url = 'http://nostarch.com'
res = requests.get(url)
res.raise_for_status()
noStarchSoup = bs4.BeautifulSoup(res.text)
type(noStarchSoup)
