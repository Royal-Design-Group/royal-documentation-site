# Meta tags
## Head
### Tags
Site verification tags such as 
with the syntax 

```html
<meta name="X-domain-verification" content="some-string-123" />
```

with different identifiers for each domain lives in prismic:

```awk
Prismic = royaldesign cms || rum21 cms
 -> Section type = Document 
 	-> Document name = Config || Configuration 
 		-> Subsection name = SEO
 			-> Slice (tab name) = Meta tags
```
exeception from above is when a tag is to be implemented on the domain <link>https://Royaldesign.com</link> which is hardcoded in the project `royal-web` and then the file:
`royal-web/packages/royaldesign/public/countries.html`


## Google tag mananger - GTM 
Most scripts related to tracking or external services lives in [google tag mananger](https://tagmanager.google.com/) where there is two accounts `Dev` which is the development enviroment connected to the stage build enviroments and `new site` which is connected to the production enviroments
