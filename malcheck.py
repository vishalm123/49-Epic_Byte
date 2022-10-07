from pysafebrowsing import SafeBrowsing
website = 'http://malware.testing.google.test/testing/malware/'
s = SafeBrowsing('AIzaSyBe4zQB__xvjNedIG3xdbPbG34Pprojjg0')
r = s.lookup_urls([website])
k = ""
if (r[website]['malicious']):
   k+="malicious\n"
   k+=f"threats:{','.join(r[website]['threats'])}"

