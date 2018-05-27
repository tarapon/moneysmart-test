#### How to use:

1) Open root page
2) Submit any http or https url
3) Use generated short url

#### Statistic
 
1) Open `/visitors/:code`, code - short url code

for short url `http://domain.com/abc` statistic page is `http://domain.com/visitors/abc`

#### Short url generation:

There are several possible url generation approaches, like making hash from original url, 
or generating completely random string and making sure this value is unique in db.

I decided to go with the most simple approach: take ID of db record and convert it to 36 base.

So record with id `1324320` becomes `/sduo`. It ensures uniqueness of generated short code.

#### Visitors data collection

For this project I collect visitor ip, user agent, and referer url.
I believe It's important to store raw collected data, because you never know how you want to parse them in future.    
Statistic page shows visitors count grouped same referer and browser name.
If we need, we can extract: 

- browser version, platform, mobile or desktop from user agent
- visitor country, city based on ip address  

### Tech stack

I decided to use rails as the quickest way to bootstrap project.

For test I used minitest for two reasons:
 - it's default in rails 5
 - I never used it before and it was interesting to try
   
I used MySql with no special reason. It can be replaced with postgres or mongo, or any other db.    
