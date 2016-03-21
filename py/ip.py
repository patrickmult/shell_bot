#Description: Given an ip determines if it is still online
import sys, os
 
def ipcheck(ip):
    status = os.system("ping -c 1 " + ip)
    return status
 
def main():
    try:
        status=ipcheck(sys.argv[1])
        if status == 0:
            print sys.argv[1] + " is online"
    except:
        print sys.argv[1] + " is offline"
 
if __name__ == "__main__":
    main()