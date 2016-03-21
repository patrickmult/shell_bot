#Description: Grabs the current Bitcoin spot rate from Coinbase
 
import json, urllib2
 
def getprice():
    data=json.load(urllib2.urlopen("https://coinbase.com/api/v1/prices/spot_rate?currency=USD"))
    return data
 
def main():
    try:
        data = getprice()
        print data['amount']+' USD'
    except:
        print 'Exception Hit while trying to acquire Bitcoin Price'
 
if __name__ == "__main__":
    main()