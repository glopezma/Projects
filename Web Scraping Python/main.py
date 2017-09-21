import bs4, requests
exampleFile = open('Top Movies - Top Box Office _ Rotten Tomatoes.html')
exampleSoup = bs4.BeautifulSoup(exampleFile.read(), "lxml")
elems = exampleSoup.select('.unstyled articleLink')
for m in elems:
    print(m)
