#!/bin/bash
#xderm (Ryan Fauzi)
#modified jakues
####################################################################
##################### initializing script ##########################
if [[ ! -e /usr/bin/assh/profile.txt ]]; then
mkdir -p /usr/bin/assh/
echo -e "mode '1'\npayload '[raw][crlf]Host: scontent.instagram.com[crlf][crlf]'\nsni 'scontent.instagram.com'\nip '202.152.240.50:8080'\nproxy '202.152.240.50'\nport '8080'" > /usr/bin/assh/profile.txt
fi
if [[ ! -e /usr/bin/assh/akun.txt ]]; then
mkdir -p /usr/bin/assh/
echo -e "zeroWRT\nxxxx\n22\nrill.tundns.pw\n" > /usr/bin/assh/akun.txt
fi
################################################################
cdir="/usr/bin"
cekscreen=$(ls /usr/sbin/|grep screen);
cekopenssl=$(ls /usr/bin/|grep openssl);
cekredsocks=$(ls /usr/sbin|grep redsocks);
ceksshpass=$(ls /usr/bin/|grep sshpass);
cekncat=$(ls /usr/bin/|grep ncat);
cekcurl=$(ls /usr/bin/|grep curl);
cektimeout=$(ls /usr/bin|grep timeout);
cekprofile=$(ls /usr/bin/assh|grep profile.txt);
cekssh=$(ls /usr/bin/assh|grep akun.txt);


if [[ -z $cekredsocks ]] || [[ -z $cektimeout ]] || [[ -z $cekopenssl ]] || [[ -z $cekcurl ]] || [[ -z $cekncat ]] || [[ -z $cekscreen ]] || [[ -z $ceksshpass ]]; then
clear
echo -e " \e[32;1m#######################################################\e[0m"
echo -e " \e[32;1m##\e[0m          \e[35;1mMemperbarui Perlengkapan XDERM\e[0m           \e[32;1m##\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
echo
echo -e " \e[36;1mPastikan Persyaratan berikut terpenuhi:\e[0m"
while true; do
echo -e " \e[32;1m*******************************************************\e[0m"
echo -e " \e[36;1m3. Akan mengupdate, mengupgrade, dan menginstall dengan otomatis.\e[0m"
echo -e " \e[36;1m4. Pastikan Router tersambung dengan internet yang lancar.\e[0m"
echo -e " \e[36;1m5. Pastikan Router sudah EXROOT dan penyimpanan flasdisk diatas 1GB.\e[0m"
echo -e " \e[36;1m6. Tested only on Pulpstone Openwrt LEDE & Chaos Chalmer.\e[0m"
echo -e " \e[36;1m7. Jangan cabut/matikan router/koneksi internet saat proses sedang berlangsung.\e[0m"
echo -e " \e[36;1m8. Router/Koneksi mati saat proses berlangsung BERPOTENSI menyebabkan router BRICK.\e[0m"
echo -e " \e[36;1m8. Router akan reboot otomatis setelah update selesai.\e[0m"
echo -e " \e[32;1m*******************************************************\e[0m"
read -p " Are you sure you want to continue? <y/N> " prompt
	if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]; then
		echo -e " \e[36;1mProses sedang berlangsung...\e[0m"
		opkg update && opkg install python-pip screen redsocks coreutils-timeout openssl-util curl ncat openssh-client sshpass httping

		echo -e " \e[36;1mProcess COMPLETE 100%\e[0m"
	else
		echo -e " \e[31;3m############## UPDATE TELAH DIBATALKAN! ###############\e[0m"
	fi
		exit 1
		done
	fi

		if [[ -f $cekprofile ]]; then
			x profile
		fi

		if [[ -f $cekssh ]]; then
		x akunssh
		fi
################################################################
 start () {
clear
echo -e " \e[32;1m#######################################################\e[0m"
echo -e " \e[32;1m##\e[0m               \e[35;1mXDERM SSH Auto Launcher             \e[0m\e[32;1m##\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
 while true; do
ips=$(ifconfig  | grep 'inet addr:'| grep -v '127.0.0.1' | grep -v '192.168.1.1' | cut -d: -f2 | awk '{ print $1}' | head -c 9)
 if [[ "$ips" == "192.168.8" ]]; then
data=$(curl -s http://192.168.8.1/api/webserver/SesTokInfo)
sesi=$(echo "$data" | grep "SessionID=" | cut -b 10-147)
token=$(echo "$data" | grep "TokInfo" | cut -b 10-41)
ip=$(curl -s http://192.168.8.1/api/monitoring/status -H "Host: 192.168.8.1" -H "Connection: keep-alive" -H "Accept: */*" -H "X-Requested-With: XMLHttpRequest" -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36" -H "Referer: http://192.168.8.1/html/home.html" -H "Accept-Encoding: gzib, deflate" -H "Accept-Language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7" -H "Cookie: $sesi" | grep 'WanIPAddress' | awk -F">" '{print $2}' | awk -F"<" '{print $1}')
elif [[ ! "$ips" == "192.168.8" ]]; then
ip=$(ifconfig  | grep 'inet addr:'| grep -v '127.0.0.1' | grep -v '192.168.1.1' | cut -d: -f2 | awk '{ print $1}')
fi

time=$(date|awk -F ' ' '{print $4}')
[[ ! -z $ip ]] || { echo -n -e " \e[36;1m($time)\e[0m \e[32;1mMenunggu Koneksi...\e[0m\e[33;1m($n)\e[0m";g=1; }
 if [ ! -f $ip ]; then
[[ $g -eq 1 ]] && { echo -e " \e[36;1m($time)\e[0m \e[32;1mMenunggu Koneksi... \e[0m\e[34;1m(OK)\e[0m"; }
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mIP anda:\e[0m \e[33;1m$ip\e[0m";break
 fi
[[ ! -z $ip ]] || { g=1;echo -n -e " \e[36;1m($time)\e[0m \e[32;1mMenunggu Koneksi... \e[0m\e[34;1m($n)\e[0m"; }

let n=$n+1;sleep 1;echo -en "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
 done
######################### first inject and replace config #######################
cd /tmp && rm -rf screenlog.0
################## membuat file Inject ####################
mode=$(cat /usr/bin/assh/profile.txt|awk "NR==1"|awk -F "'" '{print $2}')
payload=$(cat /usr/bin/assh/profile.txt|awk "NR==2"|awk -F "'" '{print $2}')
sni=$(cat /usr/bin/assh/profile.txt|awk "NR==3"|awk -F "'" '{print $2}')
proxy=$(cat /usr/bin/assh/profile.txt|awk "NR==5"|awk -F "'" '{print $2}')
port=$(cat /usr/bin/assh/profile.txt|awk "NR==6"|awk -F "'" '{print $2}')
if [ $mode -eq 1 ]; then
pf="HTTP Proxy"
echo "#!/usr/bin/python
######################################
#########__Injector Python__##########
######################################
BIND_ADDR = '0.0.0.0'
BIND_PORT = 3339
PROXT_ADDR = '$proxy'
PROXY_PORT = $port
PAYLOAD = '$payload'
import socket
import thread
import string
import select

TAM_BUFFER = 65535
MAX_CLIENT_REQUEST_LENGTH = 8192 * 8

def getReplacedPayload(payload, netData, hostPort, protocol):
    str = payload.replace('[netData]', netData)
    str = str.replace('[host_port]', (hostPort[0] + ':' + hostPort[1]))
    str = str.replace('[host]', hostPort[0])
    str = str.replace('[port]', hostPort[1])
    str = str.replace('[protocol]', protocol)
    str = str.replace('[crlf]', '\r\n')
    return str

def getRequestProtocol(request):
    inicio = request.find(' ', request.find(':')) + 1
    str = request[inicio:]
    fim = str.find('\r\n')

    return str[:fim]

def getRequestHostPort(request):
    inicio = request.find(' ') + 1
    str = request[inicio:]
    fim = str.find(' ')

    hostPort = str[:fim]

    return hostPort.split(':')

def getRequestNetData(request):
    return request[:request.find('\r\n')]

def receiveHttpMsg(socket):
    len = 1

    data = socket.recv(1)
    while data.find('\r\n\r\n'.encode()) == -1:
        if not data: break
        data = data + socket.recv(1)
        len += 1
        if len > MAX_CLIENT_REQUEST_LENGTH: break

    return data

def doConnect(clientSocket, serverSocket, tamBuffer):
    sockets = [clientSocket, serverSocket]
    timeout = 0
    print '<-> CONNECT started'

    while 1:
        timeout += 1
        ins, _, exs = select.select(sockets, [], sockets, 3)
        if exs: break

        if ins:
            for socket in ins:
                try:
                    data = socket.recv(tamBuffer)
                    if not data: break;

                    if socket is serverSocket:
                        clientSocket.sendall(data)
                    else:
                        serverSocket.sendall(data)

                    timeout = 0
                except:
                    break

        if timeout == 60: break

def acceptThread(clientSocket, clientAddr):
    print '<-> Client connected: ', clientAddr

    request = receiveHttpMsg(clientSocket)

    if not request.startswith('CONNECT'):
        print '<!> Client requisitou metodo != CONNECT!'
        clientSocket.sendall('HTTP/1.1 405 Only_CONNECT_Method!\r\n\r\n')
        clientSocket.close()
        thread.exit()

    netData = getRequestNetData(request)
    protocol = getRequestProtocol(request)
    hostPort = getRequestHostPort(netData)

    finalRequest = getReplacedPayload(PAYLOAD, netData, hostPort, protocol)

    proxySocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    proxySocket.connect((PROXT_ADDR, PROXY_PORT))
    proxySocket.sendall(finalRequest)

    proxyResponse = receiveHttpMsg(proxySocket)

    print '<-> Status line: ' + getRequestNetData(proxyResponse)

    clientSocket.sendall(proxyResponse)

    if proxyResponse.find('200 ') != -1:
        doConnect(clientSocket, proxySocket, TAM_BUFFER)

    print '<-> Client ended    : ', clientAddr
    proxySocket.close()
    clientSocket.close()
    thread.exit()


#############################__INICIO__########################################

print '\n'
print '==>Injector.py'
print '-->Listening   : ' + BIND_ADDR + ':' + str(BIND_PORT)
print '-->Remote proxy: ' + PROXT_ADDR + ':' + str(PROXY_PORT)
print '-->Payload     : ' + PAYLOAD
print '\n'

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind((BIND_ADDR, BIND_PORT))
server.listen(1)

print '<-> Server listening... '

#Recebe o cliente e despacha uma thread para atende-lo
while True:
    clientSocket, clientAddr = server.accept()
    thread.start_new_thread(acceptThread, tuple([clientSocket, 
clientAddr]))

server.close()" > /tmp/socks1
in=$(ps -w|grep socks1 -o -c)
cd /tmp
chmod +x socks1
socks="socks1"
elif [ $mode -eq 2 ]; then
pf="SSH SSL/TLS"
echo "#!/usr/bin/python
#modbyxderm
from threading import Thread, RLock
from os import system, name, path
from datetime import datetime
from random import randint
from re import findall
from ssl import create_connection, SSLContext, PROTOCOL_TLSv1_2, DER_cert_to_PEM_cert
from sys import stdout
from time import sleep
from select import select
from socket import AF_INET, SOCK_STREAM, socket, error as socket_error, timeout as socket_timeout
lock = RLock()
def log(value = ''):
    with lock: print('[%s] %s' % (datetime.now().strftime('%H:%M:%S.%f')[:-3], value))
class thread(Thread):
    def __init__(self, client, tunnel_type = 1):
        super(thread, self).__init__()
        self.socket_client, (self.client_host, self.client_port) = client
        self.tunnel_type = tunnel_type
        self.unique_id = randint(1000, 9999)
        self.daemon = True
        self.http_request_enabled = 1
        self.mode = 3

    def log(self, mode, value):
        if mode <= self.mode: log('[%s] %s' % (self.unique_id, value))

    def run(self):
        try:
            self.tunnel = xderm()
            self.tunnel.set_socket_client(self.socket_client)
            if   self.tunnel_type == 0: self.http()
            elif self.tunnel_type == 1: self.https()
        except exceptions.RequestError:
            self.log(0, 'Request blocked')
        except Exception as e: log('Exception: %s' % (e))

    def http_request_start(self):
        if self.http_request_enabled:
            self.log(0, 'HTTP Request started')
            Thread(target=self.http_request).start()

    def http_request_close(self):
        if self.http_request_enabled:
            self.log(0, 'HTTP Request stopped')

    def http_request(self):
        target_port = 1080
        target_url  = 'http://141.0.11.241'
        interval    = 2
        timeout     = 3
        socks5      = 'socks5://127.0.0.1:'+str(target_port)

    def https(self, server_name_indicate = '$sni'):
        try:
            self.log(0, 'Connecting to %s port %s' % (self.tunnel.client_request_host, self.tunnel.client_request_port))
            self.tunnel.ssl_connect()
            self.log(2, 'Server name indicate: %s' % (server_name_indicate))
            self.tunnel.ssl_handshake(server_name_indicate)
            self.log(3, 'Connection handshaked')
            self.log(3, 'Certificate:\\n\\n%s' % (self.tunnel.ssl_certificate()))
            self.log(0, 'Connection established')
            self.http_request_start()
            self.tunnel.ssl_handler()
            self.http_request_close()
        except exceptions.ConnectionTimeout:
            self.log(2, 'Connection timeout')
        except exceptions.ConnectionError:
            self.log(2, 'Connection closed')
        except exceptions.SSLHandshakeError:
            pass
        except:
            self.log(2, 'Connection exception')
        finally:
            self.tunnel.ssl_disconnect()
            self.log(1, 'Disconnected')

def header():
    system('cls' if name == 'nt' else 'clear')
    print('HTTP(s) PROXY MOD XDERM')
    print('@2018-2019 Peretas Denasri\\n')
def main(listen_port = 3339):
    try:
        server = socket(AF_INET, SOCK_STREAM)
        server.bind(('0.0.0.0', listen_port))
        server.listen(1)
    except Exception:
        log('[0000] Inject not running on port %s because port used by another programs' % listen_port)
        while True: sleep(1)
    log('[0000] Inject running on port %s' % listen_port)
    while True:
        thread(server.accept(), tunnel_type=1).start()
    class exceptions(Exception): pass
    class RequestError(Exception):        pass
    class ConnectionError(Exception):     pass
    class ConnectionTimeout(Exception):   pass
    class SSLError(Exception):            pass
    class SSLHandshakeError(Exception):   pass
    class SSLHandshakeTimeout(Exception): pass
    class NoResponse(Exception):          pass

class xderm(object):
    def __init__(self):
        super(xderm, self).__init__()

        self.BUFFER_SIZE     = 65535
        self.TIMEOUT         = 5

        self.disconnected    = False
        self.client_request  = None
        self.response        = None
        self.status_response = None

    def set_socket_client(self, socket_client):
        try:
            self.socket_client  = socket_client
            self.client_request = self.socket_client.recv(self.BUFFER_SIZE).decode('utf-8')
            if not self.client_request or not self.client_request.startswith('CONNECT'): raise exceptions.RequestError
            data = findall(r'([A-Z]+) (([a-zA-Z0-9]+(\\.[a-zA-Z0-9]+)+):([0-9]+)) (HTTP/1\\.0|HTTP/1\\.1)', self.client_request)[0]
            self.client_request_method    = data[0]
            self.client_request_host_port = data[1]
            self.client_request_host      = data[2]
            self.client_request_port      = data[4]
            self.client_request_protocol  = data[5]
        except exceptions.RequestError:
            raise exceptions.RequestError
        except Exception as e:
            print(e)
            raise exceptions

    def extract_host_port(self, host_port):
        result = findall(r'([a-zA-Z0-9]+(\\.[a-zA-Z0-9]+)+):([0-9]+)', host_port)
        return (result[0][0], int(result[0][2]))

    def connect(self, host_port = None):
        try:
            if not host_port: host_port = self.client_request_host_port
            self.socket_tunnel = socket(AF_INET, SOCK_STREAM)
            self.socket_tunnel.settimeout(self.TIMEOUT)
            self.socket_tunnel.connect(self.extract_host_port(host_port))
        except socket_timeout:
            raise exceptions.ConnectionTimeout
        except socket_error:
            raise exceptions.ConnectionError
        except Exception as e:
            print(e)
            raise exceptions

    def ssl_connect(self, host_port = None):
        try:
            if not host_port: host_port = self.client_request_host_port
            self.socket_ssl = create_connection(self.extract_host_port(host_port))
            self.socket_ssl.settimeout(self.TIMEOUT)
        except socket_timeout:
            raise exceptions.ConnectionTimeout
        except socket_error as e:
            raise exceptions.ConnectionError
        except Exception as e:
            print(e)
            raise exceptions

    def ssl_handshake(self, server_name_indicate):
        try:
            self.socket_tunnel = SSLContext(PROTOCOL_TLSv1_2).wrap_socket(self.socket_ssl, server_hostname=server_name_indicate, do_handshake_on_connect=True)
        except socket_timeout:
            raise exceptions.SSLHandshakeTimeout
        except socket_error:
            raise exceptions.SSLHandshakeError
        except Exception as e:
            print(e)
            raise exceptions

    def ssl_certificate(self):
        return DER_cert_to_PEM_cert(self.socket_tunnel.getpeercert(True))

    def request_to(self, host_port):
        host, port = self.extract_host_port(host_port)
        self.client_request_method    = 'CONNECT'
        self.client_request_host_port = host_port
        self.client_request_host      = host
        self.client_request_port      = port
        self.client_request_protocol  = 'HTTP/1.0'

    def payload_decode(self, payload):
        payload = payload.replace('[real_raw]', '[raw][crlf][crlf]')
        payload = payload.replace('[raw]', '[method] [host_port] [protocol]')
        payload = payload.replace('[method]', self.client_request_method)
        payload = payload.replace('[host_port]', self.client_request_host_port)
        payload = payload.replace('[host]', self.client_request_host)
        payload = payload.replace('[port]', str(self.client_request_port))
        payload = payload.replace('[protocol]', self.client_request_protocol)
        payload = payload.replace('[user-agent]', 'User-Agent: Chrome/1.1.3')
        payload = payload.replace('[keep-alive]', 'Connection: Keep-Alive')
        payload = payload.replace('[close]', 'Connection: Close')
        payload = payload.replace('[crlf]', '[cr][lf]')
        payload = payload.replace('[lfcr]', '[lf][cr]')
        payload = payload.replace('[cr]', '\\r')
        payload = payload.replace('[lf]', '\\n')

        return payload.encode('utf-8')

    def specialchars(self, value):
        return value.replace('\\r', '\\\r').replace('\\n', '\\\n')

    def send_payload(self, payload_encoded = None):
        if not payload_encoded: payload_encoded = '[method] [host_port] [protocol][crlf][crlf]'
        payload_split = payload_encoded.split('[split]')
        for i in range(len(payload_split)):
            if i > 0: sleep(0.200)
            payload = payload_split[i]
            payload = self.payload_decode(payload)
            self.socket_tunnel.sendall(payload)

    def take_response(self):
        try:
            response = self.socket_tunnel.recv(self.BUFFER_SIZE).decode('charmap')
            self.response = response.replace('\\r','').split('\\n\\n')[0]
            self.status_response = response.replace('\\r','').split('\\n')[0]
        except socket_error:
            raise exceptions.NoResponse
        except UnicodeEncodeError:
            pass
        except Exception as e:
            print(e)
            raise exceptions

    def ssl_handler(self):
        self.handler()

    def handler(self):
        sockets = [self.socket_tunnel, self.socket_client]
        timeout = 0
        self.socket_client.sendall(b'HTTP/1.0 200 Connection established\\r\\n\\r\\n')
        while True:
            timeout += 1
            ins, _, exs = select(sockets, [], sockets, 3)
            if exs: break
            if ins:
                for socket in ins:
                    try:
                        data = socket.recv(self.BUFFER_SIZE)
                        if not data: break
                        if   socket is self.socket_tunnel: self.socket_client.sendall(data)
                        elif socket is self.socket_client: self.socket_tunnel.sendall(data)
                        timeout = 0
                    except: break
            if timeout == 60: break
        self.disconnected = True

    def ssl_disconnect(self):
        self.socket_client.close()

    def disconnect(self):
        self.socket_client.close()
        self.socket_tunnel.close()

if __name__ == '__main__':
    header()
    main()" > /tmp/socks2
in=$(ps -w|grep socks2 -o -c)
cd /tmp
chmod +x socks2
socks="socks2"
fi
if [ "$in" != "3" ]; then
n=1
screen -d -m -L ./$socks
sleep 1
   while true; do
tcp=$(netstat -tnlpu|grep tcp|grep :3339|grep LISTEN|awk -F " " '{print $1}'|awk "NR==1")
time=$(date|awk -F ' ' '{print $4}')
echo -e -n " \e[36;1m($time)\e[0m \e[32;1mMenjalankan Inject... \e[0m\e[33;1m($n)\e[0m"
pus=$(echo $n|wc -c)
 if [ $pus -eq 2 ]; then
echo -en "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
 fi
  if [ $pus -eq 3 ]; then
echo -en "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
  fi
    if [ ! -f $tcp ]; then
   if [ $tcp == "tcp" ]; then
time=$(date|awk -F ' ' '{print $4}')
echo -e " \e[36;1m($time)\e[0m \e[32;1mMenjalankan Inject... \e[0m\e[34;1m(OK)\e[0m"
sleep 2
break
   fi
    fi
[[ $n -gt 30 ]] && { echo -e " \e[36;1m($time)\e[0m \e[31;1mInject gagal Berjalan...! \e[0m";exit; }
let n=$n+1;sleep 1
   done
else
echo -e " \e[36;1m($time)\e[0m \e[32;1mInject Sudah Berjalan !\e[0m"
fi
user=$(cat /usr/bin/assh/akun.txt|awk "NR==1");pass=$(cat /usr/bin/assh/akun.txt|awk "NR==2")
host=$(cat /usr/bin/assh/akun.txt|awk "NR==4");port=$(cat /usr/bin/assh/akun.txt|awk "NR==3")
j=$(echo $pass|wc -c)
[[ $j != 2 ]] && { pss=$(echo $pass|head -c1);pss=$(echo "$pss*******"); } || { pss="*"; }
cd /root
######################### end inject and replace config #######################
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mMethod:\e[0m \e[34;1m'$pf'\e[0m \e[0m";cd $cdir
#account
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mMemuat Akun SSH...\e[0m"
echo -e " \e[36;1m($time)\e[0m \e[35;1m############################################\e[0m"
c=$(ls $cdir/assh/|grep akun.txt)
[[ ! -z $c ]] || { time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mAkun SSH belum dibuat!\e[0m\n \e[36;1m($time)\e[0m \e[32;1m Berhenti.\e[0m\n";exit; }
 if [ ! -f $host ] && [ ! -f $port ] && [ ! -f $user ] && [ ! -f $pass ]; then
time=$(date|awk -F ' ' '{print $4}')
modes=$(cat /usr/bin/assh/profile.txt|awk "NR==1"|awk -F "'" '{print $2}')
if [ $modes -eq 2 ]; then
echo -e " \e[36;1m($time)\e[0m \e[32;1mHost:\e[0m \e[33;1m$host\e[0m\n \e[36;1m($time)\e[0m \e[32;1mPort:\e[0m \e[33;1m443\e[0m\n \e[36;1m($time)\e[0m \e[32;1mUser:\e[0m \e[33;1m$user\e[0m\n \e[36;1m($time)\e[0m \e[32;1mPass:\e[0m \e[33;1m$pss\e[0m"
else
echo -e " \e[36;1m($time)\e[0m \e[32;1mHost:\e[0m \e[33;1m$host\e[0m\n \e[36;1m($time)\e[0m \e[32;1mPort:\e[0m \e[33;1m$port\e[0m\n \e[36;1m($time)\e[0m \e[32;1mUser:\e[0m \e[33;1m$user\e[0m\n \e[36;1m($time)\e[0m \e[32;1mPass:\e[0m \e[33;1m$pss\e[0m"
fi
echo -e " \e[36;1m($time)\e[0m \e[35;1m############################################\e[0m"
 fi
modes=$(cat /usr/bin/assh/profile.txt|awk "NR==1"|awk -F "'" '{print $2}')
if [ $modes -eq 2 ]; then
screen -d -m sshpass -p $pass ssh -oStrictHostKeyChecking=no -CND :8888 -p 443 $user@$host -o "Proxycommand=ncat --proxy-type http --proxy 127.0.0.1:3339 %h %p"
else
screen -d -m sshpass -p $pass ssh -oStrictHostKeyChecking=no -CND :8888 -p $port $user@$host -o "Proxycommand=ncat --proxy-type http --proxy 127.0.0.1:3339 %h %p"
fi
n=1;ulang=1
   while [ $ulang -eq 1 ]; do
time=$(date|awk -F ' ' '{print $4}');echo -n -e " \e[36;1m($time)\e[0m \e[32;1mMenjalankan SSH...\e[0m \e[33;1m($n)\e[0m"
rm -rf /tmp/sshlog.txt;curl -s --trace /tmp/sshlog.txt 192.168.1.1:8888 > /dev/null
log=$(grep Info /tmp/sshlog.txt|awk -F':' '{print $2}'|awk -F' ' '{print $1}');pus=$(echo $n|wc -c)
 if [ $pus -eq 2 ]; then
echo -en "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
 fi
  if [ $pus -eq 3 ]; then
echo -en "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
  fi
 if [ "$log" != "Failed" ]; then
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mMenjalankan SSH...\e[0m \e[34;1m(OK)\e[0m";ulang=2;break
 fi
  if [ "$log" == "Failed" ] && [ $n -gt 14 ]; then
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mMenjalankan SSH...\e[0m \e[31;1m(Failed)\e[0m"
echo -e " \e[36;1m($time)\e[0m \e[32;1mIngin Mengulang Koneksi ? [y/N] \e[0m"
time=$(date|awk -F ' ' '{print $4}');read -t 8 -n 1 -s -p " ($time) " n;echo -en "\b\b\b\b\b\b\b\b\b\b\b\b";
 [[ ! -z $n ]] || { n=y; }
if [ "$n" == "y" ]; then
rm -f screenlog.0;killall -q redsocks sshpass dnsmasq;n=0;ulang=1
modes=$(cat /usr/bin/assh/profile.txt|awk "NR==1"|awk -F "'" '{print $2}')
if [ $modes -eq 2 ]; then
screen -d -m sshpass -p $pass ssh -oStrictHostKeyChecking=no -CND :8888 -p 443 $user@$host -o "Proxycommand=ncat --proxy-type http --proxy 127.0.0.1:3339 %h %p"
else
screen -d -m sshpass -p $pass ssh -oStrictHostKeyChecking=no -CND :8888 -p $port $user@$host -o "Proxycommand=ncat --proxy-type http --proxy 127.0.0.1:3339 %h %p"
fi
else
killall -q redsocks sshpass dnsmasq;/etc/init.d/dnsmasq start > /dev/null
outp=$(iptables -w -t nat -L OUTPUT --line-number -n|grep REDSOCKS|awk -F " " '{print $1}')
[[ -z $outp ]] || { iptables -w -t nat -F OUTPUT; }
 while true; do
lines=$(iptables -w -t nat -L PREROUTING --line-number -n|grep tcp|awk "NR==1"|awk -F " " '{print $1}')
[[ -z $lines ]] || { iptables -w -t nat -D PREROUTING $lines;continue; } && { break; }
 done
reds=$(iptables -w -t nat -L -n|grep REDSOCKS|awk -F " " '{print $1}')
[[ -z $reds ]] || { iptables -w -t nat -F REDSOCKS;iptables -w -t nat -X REDSOCKS; }
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[31;1mBerhenti.\e[0m"
rm -rf /tmp/sshlog.txt;exit
fi
  fi
sleep 1;let n=$n+1
 done
rm -rf /tmp/sshlog.txt;time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mMenjalankan Redsocks & DNS...\e[0m"
killall -q dnsmasq;sed -i "s/port=53/port=54/g" /var/etc/dnsmasq.con*
killall -q dnsmasq;mv -fn /etc/init.d/dnsmasq /etc/init.d/dnsmasq1
killall -q dnsmasq;dnsmasq -C /var/etc/dnsmasq.con* -x /var/run/dnsmasq/dnsmasq.pid
mv -fn /etc/init.d/dnsmasq1 /etc/init.d/dnsmasq
###########################################################################################
killall -q redsocks;echo "base { log_debug = off;log_info = on;log = \"syslog:local7\";
daemon = on;redirector = iptables; }
redsocks { local_ip = 0.0.0.0;local_port = 8889;
ip = 0.0.0.0;port = 8888;type = socks5; }
redudp { local_ip = 0.0.0.0;
local_port = 10053;ip = 0.0.0.0;port = 8889;
udp_timeout = 30; }
dnstc { local_ip = 0.0.0.0;local_port = 5300; }" > /etc/redsocks.conf;killall -q redsocks;redsocks
###########################################################################################
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mRouting IPtables Redsocks...\e[0m"
outp=$(iptables -w -t nat -L OUTPUT --line-number -n|grep REDSOCKS|awk -F " " '{print $1}')
[[ -z $outp ]] || { iptables -w -t nat -F OUTPUT; }
 while true; do
lines=$(iptables -w -t nat -L PREROUTING --line-number -n|grep tcp|awk "NR==1"|awk -F " " '{print $1}')
[[ -z $lines ]] || { iptables -w -t nat -D PREROUTING $lines;continue; } && { break; }
 done
reds=$(iptables -w -t nat -L -n|grep REDSOCKS|awk -F " " '{print $1}')
[[ -z $reds ]] || { iptables -w -t nat -F REDSOCKS;iptables -w -t nat -X REDSOCKS; }
iptables -t nat -N REDSOCKS
iptables -t nat -A REDSOCKS -d 0.0.0.0/8 -j ACCEPT
iptables -t nat -A REDSOCKS -d 10.0.0.0/8 -j ACCEPT
iptables -t nat -A REDSOCKS -d 127.0.0.0/8 -j ACCEPT
iptables -t nat -A REDSOCKS -d 169.254.0.0/16 -j ACCEPT
iptables -t nat -A REDSOCKS -d 172.16.0.0/12 -j ACCEPT
iptables -t nat -A REDSOCKS -d 192.168.0.0/16 -j ACCEPT
iptables -t nat -A REDSOCKS -p tcp -j REDIRECT --to-ports 8889
iptables -t nat -A OUTPUT -p tcp -j REDSOCKS
iptables -t nat -A PREROUTING -p tcp -d 192.168.0.0/16 -j ACCEPT
iptables -t nat -A PREROUTING -p tcp -j REDIRECT --to-ports 8889
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mJalankan Reconnect SSH Otomatis? [y/N]\e[0m"
time=$(date|awk -F ' ' '{print $4}');read -t 8 -n 1 -s -p " ($time) " y;echo -en "\b\b\b\b\b\b\b\b\b\b\b";
[[ ! -z $y ]] || { y=n; }
 if [ "$y" == "y" ]; then
rm -rf /tmp/bot.sh
############################################ MEMBUAT FILE AUTO REKONEK ###############################################
echo "#!/bin/bash
#bot
clear;n=1;h=0
 while true; do
cdir=/usr/bin
user=\$(cat \$cdir/assh/akun.txt|awk \"NR==1\");pass=\$(cat \$cdir/assh/akun.txt|awk \"NR==2\")
host=\$(cat \$cdir/assh/akun.txt|awk \"NR==4\");port=\$(cat \$cdir/assh/akun.txt|awk \"NR==3\");sleep 1
iface=\$(route|grep default | awk '{print \$8}')
data1=\$(ifconfig \$iface|grep \"bytes\"|awk -F \".\" '{print \$2}'|awk -F \" \" '{print \$1}')
resp=\$(curl -m 5 -s --write-out %{http_code} --output /dev/null --socks5-hostname 192.168.1.1:8888 http://ping.eu)
 if [ \$resp != \"301\" ]; then
data2=\$(ifconfig \$iface|grep \"bytes\"|awk -F \".\" '{print \$2}'|awk -F \" \" '{print \$1}')
if [ \$data1 == \$data2 ]; then
outp=\$(iptables -w -t nat -L OUTPUT --line-number -n|grep REDSOCKS|awk -F \" \" '{print \$1}')
[[ -z \$outp ]] || { iptables -w -t nat -F OUTPUT; }
 while true; do
lines=\$(iptables -w -t nat -L PREROUTING --line-number -n|grep tcp|awk \"NR==1\"|awk -F \" \" '{print \$1}')
[[ -z \$lines ]] || { iptables -w -t nat -D PREROUTING \$lines;continue; } && { break; }
 done
reds=\$(iptables -w -t nat -L -n|grep REDSOCKS|awk -F \" \" '{print \$1}')
[[ -z \$reds ]] || { iptables -w -t nat -F REDSOCKS;iptables -w -t nat -X REDSOCKS; }
killall -q sshpass redsocks;echo -n -e \"\e[31;1mSSH DISSCONNECT!\e[0m [\$n]\";let h=\$h+1
modes=\$(cat \$cdir/assh/profile.txt|awk \"NR==1\"|awk -F \"'\" '{print \$2}')
if [ \$modes -eq 2 ]; then
screen -d -m sshpass -p \$pass ssh -oStrictHostKeyChecking=no -CND :8888 -p 443 \$user@\$host -o \"Proxycommand=ncat --proxy-type http --proxy 127.0.0.1:3339 %h %p\"
elif [ \$modes -eq 1 ]; then
screen -d -m sshpass -p \$pass ssh -oStrictHostKeyChecking=no -CND :8888 -p \$port \$user@\$host -o \"Proxycommand=ncat --proxy-type http --proxy 127.0.0.1:3339 %h %p\"
fi
sleep 4
iptables -t nat -N REDSOCKS
iptables -t nat -A REDSOCKS -d 0.0.0.0/8 -j ACCEPT
iptables -t nat -A REDSOCKS -d 10.0.0.0/8 -j ACCEPT
iptables -t nat -A REDSOCKS -d 127.0.0.0/8 -j ACCEPT
iptables -t nat -A REDSOCKS -d 169.254.0.0/16 -j ACCEPT
iptables -t nat -A REDSOCKS -d 172.16.0.0/12 -j ACCEPT
iptables -t nat -A REDSOCKS -d 192.168.0.0/16 -j ACCEPT
iptables -t nat -A REDSOCKS -p tcp -j REDIRECT --to-ports 8889
iptables -t nat -A OUTPUT -p tcp -j REDSOCKS
iptables -t nat -A PREROUTING -p tcp -d 192.168.0.0/16 -j ACCEPT
iptables -t nat -A PREROUTING -p tcp -j REDIRECT --to-ports 8889
fi
else echo -n -e \"\e[32;1mSSH CONNECTED..!\e[0m [\$n]\";h=1
 fi
r=\$(ps -w|grep redsocks -o -c)
if [[ ! \$r == "2" ]]; then
killall -q redsocks
redsocks
fi
sleep 3
let n=\$n+1;echo -en \"\\b\\b\\b\\b\\b\\b\\b\\b\\b\\b\\b\\b\\b\\b\\b\\b\\b\\b\\b\\b\\b\\b\\b\\b\\b\\b\\b\\b\\b\\b\\b\\b\\b\\b\"
 done" > /tmp/bot.sh
######################################################################################################################
chmod +x /tmp/bot.sh;cd /tmp;screen -d -m ./bot.sh
time=$(date|awk -F ' ' '{print $4}');echo -e "\e[36;1m($time)\e[0m \e[34;1mAuto reconnect Telah diaktifkan!\e[0m"
else
time=$(date|awk -F ' ' '{print $4}');echo -e "\e[36;1m($time)\e[0m \e[31;1mAuto reconnect Tidak diaktifkan!\e[0m"
 fi
sleep 1;rm -rf /tmp/bot.txt $cdir/inject/screenlog.0
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mSelesai.\e[0m\n";exit
}
 rules () {
clear
echo -e " \e[32;1m#######################################################\e[0m"
echo -e " \e[32;1m##\e[0m            \e[35;1mAuto Configuration IPtables\e[0m            \e[32;1m##\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
echo
time=$(date|awk -F ' ' '{print $4}')
echo -e " \e[36;1m($time)\e[0m\e[0m\e[32;1m Masukkan proxy/ip Pengecualian IPtables:\e[0m"
echo -e " \e[36;1m($time)\e[0m\e[0m\e[32;1m Kosongkan dan ENTER untuk kembali\e[0m"
read -p " ($time) " proxyip
 if [ -z "$proxyip" ]; then
clear
echo -e " \e[32;1m#######################################################\e[0m"
echo -e " \e[32;1m##\e[0m              \e[31;3mIPTABLES GAGAL DISIMPAN!\e[0m             \e[32;1m##\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
echo
 else
lines=$(iptables -w -t nat -L PREROUTING -n --line-number|grep REDIRECT|awk -F " " '{print $1}')
[[ -z $lines ]] || { iptables -w -t nat -D PREROUTING $lines; }
iptables -w -t nat -A PREROUTING -d $proxyip -p tcp -j ACCEPT
iptables -w -t nat -A PREROUTING -p tcp -j REDIRECT --to-port 8889
time=$(date|awk -F ' ' '{print $4}')
echo -e " \e[36;1m($time)\e[0m\e[32;1m Selesai.\e[0m\n"
fi
exit
}
 stop () {
clear
echo -e " \e[32;1m#######################################################\e[0m"
echo -e " \e[32;1m##\e[0m               \e[35;1mXDERM SSH Auto Stopper\e[0m              \e[32;1m##\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
dns1=$(cat /tmp/resolv.conf.auto|grep name|awk "NR==1"|awk -F " " '{print $2}')
dns2=$(cat /tmp/resolv.conf.auto|grep name|awk "NR==2"|awk -F " " '{print $2}')
killall -q redsocks dnsmasq sshpass bot.sh;/etc/init.d/dnsmasq start > /dev/null 2>&1
outp=$(iptables -w -t nat -L OUTPUT --line-number -n|grep REDSOCKS|awk -F " " '{print $1}')
[[ -z $outp ]] || { iptables -w -t nat -F OUTPUT; }
 while true; do
lines=$(iptables -w -t nat -L PREROUTING --line-number -n|grep tcp|awk "NR==1"|awk -F " " '{print $1}')
[[ -z $lines ]] || { iptables -w -t nat -D PREROUTING $lines;continue; } && { break; }
 done
reds=$(iptables -w -t nat -L -n|grep REDSOCKS|awk -F " " '{print $1}')
[[ -z $reds ]] || { iptables -w -t nat -F REDSOCKS;iptables -w -t nat -X REDSOCKS; }



ips=$(ifconfig  | grep 'inet addr:'| grep -v '127.0.0.1' | grep -v '192.168.1.1' | cut -d: -f2 | awk '{ print $1}' | head -c 9)
 if [[ "$ips" == "192.168.8" ]]; then
data=$(curl -s http://192.168.8.1/api/webserver/SesTokInfo)
sesi=$(echo "$data" | grep "SessionID=" | cut -b 10-147)
token=$(echo "$data" | grep "TokInfo" | cut -b 10-41)
ipp=$(curl -s http://192.168.8.1/api/monitoring/status -H "Host: 192.168.8.1" -H "Connection: keep-alive" -H "Accept: */*" -H "X-Requested-With: XMLHttpRequest" -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36" -H "Referer: http://192.168.8.1/html/home.html" -H "Accept-Encoding: gzib, deflate" -H "Accept-Language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7" -H "Cookie: $sesi" | grep 'WanIPAddress' | awk -F">" '{print $2}' | awk -F"<" '{print $1}')
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mIP Address saat ini \e[0m\e[33;1m$ipp\e[0m"
elif [[ ! "$ips" == "192.168.8" ]]; then
ipa=$(ifconfig  | grep 'inet addr:'| grep -v '127.0.0.1' | grep -v '192.168.1.1' | cut -d: -f2 | awk '{ print $1}')
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mIP Address saat ini \e[0m\e[33;1m$ipa\e[0m"
fi


in=$(ps | grep socks)
 if [[ $in = *"socks1"* ]] || [[ $in = *"socks2"* ]]; then
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mIngin Hentikan Proses Inject? [y/N]\e[0m"
time=$(date|awk -F ' ' '{print $4}');read -t 10 -n 1 -s -p " ($time) " y;echo -en "\b\b\b\b\b\b\b\b\b\b\b\b"
[[ $y == "y" ]] && { killall -q socks1 socks2;time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mInject dihentikan!\e[0m"; } || { time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[31;1mInject Tetap Berjalan!\e[0m"; }
 fi
 
 
 
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mIngin Reconnect Modem juga? [y/N]\e[0m"
time=$(date|awk -F ' ' '{print $4}');read -t 10 -n 1 -s -p " ($time) " ym;echo -en "\b\b\b\b\b\b\b\b\b\b\b\b"
if [[ $ym == "y" ]]; then
ip=$(ifconfig  | grep 'inet addr:'| grep -v '127.0.0.1' | grep -v '192.168.1.1' | cut -d: -f2 | awk '{ print $1}' | head -c 9)
 if [[ "$ip" == "192.168.8" ]]; then
spin() {
    n=1;ulang=1
    while true; do
        time=$(date|awk -F ' ' '{print $4}');echo -n -e " \e[36;1m($time)\e[0m \e[32;1mReconnecting...\e[0m \e[33;1m($n)\e[0m"
pus=$(echo $n|wc -c)
 if [ $pus -eq 2 ]; then
echo -en "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
 fi
  if [ $pus -eq 3 ]; then
echo -en "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
  fi
        sleep 1;let n=$n+1
    done
}

spin & pid=$!

#your task here
data=$(curl -s http://192.168.8.1/api/webserver/SesTokInfo)
sesi=$(echo "$data" | grep "SessionID=" | cut -b 10-147)
token=$(echo "$data" | grep "TokInfo" | cut -b 10-41)
off=$(curl -s -X POST http://192.168.8.1/api/dialup/mobile-dataswitch -H "Host: 192.168.8.1" -H "Connection: keep-alive" -H "Content-Length: 83" -H "Accept: */*" -H "Origin: http://192.168.8.1" -H "X-Requested-With: XMLHttpRequest" -H "__RequestVerificationToken: $token" -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36" -H "Content-Type: application/x-www-form-urlencoded; charset=UTF-8" -H "Referer: http://192.168.8.1/html/home.html" -H "Accept-Encoding: gzib, deflate" -H "Accept-Language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7" -H "Cookie: $sesi" -d "<request><dataswitch>0</dataswitch></request>")
data=$(curl -s http://192.168.8.1/api/webserver/SesTokInfo)
sesi=$(echo "$data" | grep "SessionID=" | cut -b 10-147)
token=$(echo "$data" | grep "TokInfo" | cut -b 10-41)
on=$(curl -s -X POST http://192.168.8.1/api/dialup/mobile-dataswitch -H "Host: 192.168.8.1" -H "Connection: keep-alive" -H "Content-Length: 83" -H "Accept: */*" -H "Origin: http://192.168.8.1" -H "X-Requested-With: XMLHttpRequest" -H "__RequestVerificationToken: $token" -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36" -H "Content-Type: application/x-www-form-urlencoded; charset=UTF-8" -H "Referer: http://192.168.8.1/html/home.html" -H "Accept-Encoding: gzib, deflate" -H "Accept-Language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7" -H "Cookie: $sesi" -d "<request><dataswitch>1</dataswitch></request>")
sleep 2
ip=$(curl -s http://192.168.8.1/api/monitoring/status -H "Host: 192.168.8.1" -H "Connection: keep-alive" -H "Accept: */*" -H "X-Requested-With: XMLHttpRequest" -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36" -H "Referer: http://192.168.8.1/html/home.html" -H "Accept-Encoding: gzib, deflate" -H "Accept-Language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7" -H "Cookie: $sesi" | grep 'WanIPAddress' | awk -F">" '{print $2}' | awk -F"<" '{print $1}')

 if [ $ip ]; then
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mReconnecting...\e[0m \e[34;1m(OK)\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mRECONNECT SUCCESS! IP Terbaru \e[0m\e[33;1m$ip\e[0m\n"
 else
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mReconnecting...\e[0m \e[31;1m(FAILED)\e[0m" 
 fi
# kill the spinner task
kill $pid > /dev/null 2>&1
ip=$(ifconfig  | grep 'inet addr:'| grep -v '127.0.0.1' | grep -v '192.168.1.1' | cut -d: -f2 | awk '{ print $1}' | head -c 9)
elif [[ ! "$ip" == "192.168.8" ]]; then
spin() {
    n=1;ulang=1
    while true; do
        time=$(date|awk -F ' ' '{print $4}');echo -n -e " \e[36;1m($time)\e[0m \e[32;1mReconnecting...\e[0m \e[33;1m($n)\e[0m"
pus=$(echo $n|wc -c)
 if [ $pus -eq 2 ]; then
echo -en "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
 fi
  if [ $pus -eq 3 ]; then
echo -en "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
  fi
        sleep 1;let n=$n+1
    done
}

spin & pid=$!

#your task here
sed -i "1s,.*,config '3ginfo',g" /etc/config/3ginfo
sed -i "2s,.*,        option 'device' '/dev/ttyUSB2',g" /etc/config/3ginfo
sed -i "3s,.*,        option 'pincode' '',g" /etc/config/3ginfo
sed -i "4s,.*,        option 'http_port' '81',g" /etc/config/3ginfo
sed -i "5s,.*,        option 'language' 'en',g" /etc/config/3ginfo
sed -i "6s,.*,        option 'network' '4g',g" /etc/config/3ginfo
#data1=$(curl -s http://192.168.1.1:81/cgi-bin/onoff.sh)
#data2=$(curl -s http://192.168.1.1:81/cgi-bin/onoff.sh)
UP=$(ifstatus 4g | grep "\"up\": true")
if [ -n "$UP" ]; then
        ifdown 4g > /dev/null 2>&1
        ifup 4g > /dev/null 2>&1
else
        ifup 4g > /dev/null 2>&1
fi
sleep 15
ip=$(ifconfig  | grep 'inet addr:'| grep -v '127.0.0.1' | grep -v '192.168.1.1' | cut -d: -f2 | awk '{ print $1}')

 if [ $ip ]; then
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mReconnecting...\e[0m \e[34;1m(OK)\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mRECONNECT SUCCESS! IP Terbaru \e[0m\e[33;1m$ip\e[0m\n"
 else
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mReconnecting...\e[0m \e[31;1m(FAILED)\e[0m" 
 fi

# kill the spinner task
kill $pid > /dev/null 2>&1
fi
fi
if [[ ! $ym == "y" ]]; then
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[31;1mReconnect Modem Dibatalkan!\e[0m\n"
fi


exit
}
 check () {
clear
echo -e " \e[32;1m#######################################################\e[0m"
echo -e " \e[32;1m##\e[0m                 \e[35;1mXDERM Host Checker\e[0m                \e[32;1m##\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mPilih Nomor:\e[0m"
while true; do
echo -e " \e[32;1m#######################################################\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[33;1m1.\e[0m\e[32;1mHost Checker Proxy mode\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[33;1m2.\e[0m\e[32;1mHost Checker Direct mode\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[33;1m3.\e[0m\e[32;1mHost Checker SSL/TLS Mode\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[33;1m4.\e[0m\e[32;1mEXIT\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
read -p " ($time) " no
 if [ -f $no ] || [ $no -gt "4" ] || [ $no == "0" ] || [[ $no != *[[:digit:]]* ]]; then
clear
echo -e " \e[32;1m#######################################################\e[0m"
echo -e " \e[32;1m##\e[0m              \e[31;3mPILIH NOMOR DENGAN BENAR!\e[0m            \e[32;1m##\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mPilih Nomor:\e[0m"
continue
 fi
if [ $no == "1" ]; then
clear
proxy=$(cat /usr/bin/assh/profile.txt|awk "NR==4"|awk -F "'" '{print $2}')
echo -e " \e[32;1m#######################################################\e[0m"
echo -e " \e[32;1m##\e[0m                 \e[35;1mXDERM Host Checker\e[0m                \e[32;1m##\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mProxy Mode:\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mProxy yang digunakan: \e[0m\e[33;1m$proxy\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mMasukkan Method & BUG yang ingin ditest\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mContoh:\e[0m \e[33;1mGET google.com\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mKosongkan dan ENTER untuk kembali\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
read -p " ($time) " test
 if [ -z "$test" ]; then
clear
echo -e " \e[32;1m#######################################################\e[0m"
echo -e " \e[32;1m##\e[0m                     \e[31;3mCANCELED!\e[0m                     \e[32;1m##\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mPilih Nomor:\e[0m"
continue
 else 
method=$(echo "$test" | awk '{print $1}')
bug=$(echo "$test" | awk '{print $2}')
exe=$(curl -v -s -m 2 -X $method -o /dev/null -w "%{http_code} %{redirect_url}" --proxy http://$proxy http://$bug)
fi
fi
if [ $no == "2" ]; then
clear
echo -e " \e[32;1m#######################################################\e[0m"
echo -e " \e[32;1m##\e[0m                 \e[35;1mXDERM Host Checker\e[0m                \e[32;1m##\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mDirect Mode:\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mMasukkan Method & BUG yang ingin ditest\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mContoh:\e[0m \e[33;1mGET google.com\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mKosongkan dan ENTER untuk kembali\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
read -p " ($time) " test
 if [ -z "$test" ]; then
clear
echo -e " \e[32;1m#######################################################\e[0m"
echo -e " \e[32;1m##\e[0m                     \e[31;3mCANCELED!\e[0m                     \e[32;1m##\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mPilih Nomor:\e[0m"
continue
 else 
method=$(echo "$test" | awk '{print $1}')
bug=$(echo "$test" | awk '{print $2}')
exe=$(curl -v -s -m 2 -X $method -o /dev/null -w "%{http_code} %{redirect_url}" http://$bug)
fi
fi
if [ $no == "3" ]; then
clear
hss=$(cat /usr/bin/assh/akun.txt|awk "NR==4")
echo -e " \e[32;1m#######################################################\e[0m"
echo -e " \e[32;1m##\e[0m                 \e[35;1mXDERM Host Checker\e[0m                \e[32;1m##\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mSSL/TLS Mode:\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mIP SSH utama \e[0m\e[33;1m$hss:443\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mPastikan SSH support SSL/TLS\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mMasukkan Host SNI yang ingin ditest:\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mContoh:\e[0m\e[33;1mgooglevideo.com\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mKosongkan dan ENTER untuk kembali\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
read -p " ($time) " test
 if [ -z "$test" ]; then
clear
echo -e " \e[32;1m#######################################################\e[0m"
echo -e " \e[32;1m##\e[0m                     \e[31;3mCANCELED!\e[0m                     \e[32;1m##\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mPilih Nomor:\e[0m"
continue
 else 
hss=$(cat /usr/bin/assh/akun.txt|awk "NR==4")
exe=$(timeout 3 openssl s_client -connect $hss:443 -servername $test)
if [[ $exe == *"dropbear"* ]]; then
   hasilkode="100% WORKING SSL/TLS MODE"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[33;1m$hasilkode: $test\e[0m"
elif [[ $exe == *"TLS session ticket"* ]]; then
   hasilkode="50% WORKING SSL/TLS MODE"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[33;1m$hasilkode: $test\e[0m"
else
   hasilkode="Connection Timeout" 
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[31;1m$hasilkode: $test\e[0m"
fi
fi
fi
if [ $no == "4" ]; then
clear
exit
fi
exit
done
}
 finder () {
clear
echo -e " \e[32;1m#######################################################\e[0m"
echo -e " \e[32;1m##\e[0m               \e[35;1mPencarian IP Address\e[0m                \e[32;1m##\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
echo
echo -e "                     \e[36;1mComming Soon...\e[0m"
echo
sleep 2
clear
exit
}
 profile () {
clear
echo -e " \e[32;1m#######################################################\e[0m"
echo -e " \e[32;1m##\e[0m       \e[35;1mPerbarui Mode Inject - Payload & BUG\e[0m        \e[32;1m##\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mPilih Nomor:\e[0m"
while true; do
echo -e " \e[32;1m#######################################################\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[33;1m1.\e[0m\e[32;1mUbah ke mode PROXY\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[33;1m2.\e[0m\e[32;1mUbah ke mode SSL\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[33;1m3.\e[0m\e[32;1mGanti Payload\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[33;1m4.\e[0m\e[32;1mGanti BUG SNI\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[33;1m5.\e[0m\e[32;1mGanti proxy\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[33;1m6.\e[0m\e[32;1mEXIT\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
read -p " ($time) " no
 if [ -f $no ] || [ $no -gt "6" ] || [ $no == "0" ] || [[ $no != *[[:digit:]]* ]]; then
clear
echo -e " \e[32;1m#######################################################\e[0m"
echo -e " \e[32;1m##\e[0m              \e[31;3mPILIH NOMOR DENGAN BENAR!\e[0m            \e[32;1m##\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mPilih Nomor:\e[0m"
continue
 fi
if [ $no == "1" ]; then
clear
echo -e " \e[32;1m#######################################################\e[0m"
sed -i "1s,.*,mode '1',g" /usr/bin/assh/profile.txt
echo -e " \e[32;3m##\e[0m          \e[33;1mSUKSES MENGGANTI KE MODE PROXY\e[0m           \e[32;3m##\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mPilih Nomor:\e[0m"
continue
fi
if [ $no == "2" ]; then
clear
echo -e " \e[32;1m#######################################################\e[0m"
sed -i "1s,.*,mode '2',g" /usr/bin/assh/profile.txt
echo -e " \e[32;3m##\e[0m           \e[33;1mSUKSES MENGGANTI KE MODE SSL\e[0m            \e[32;3m##\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mPilih Nomor:\e[0m"
continue
fi
if [ $no == "3" ]; then
payload=$(cat /usr/bin/assh/profile.txt|awk "NR==2"|awk -F "'" '{print $2}')
clear
echo -e " \e[32;1m#######################################################\e[0m"
echo -e " \e[32;1m##\e[0m       \e[35;1mPerbarui Mode Inject - Payload & BUG\e[0m        \e[32;1m##\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mGanti Payload:\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mPayload Sekarang:\e[0m \e[33;1m$payload\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mMasukkan Payload Baru:\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mKosongkan dan ENTER untuk kembali\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
read -p " ($time) " payload
 if [ -z "$payload" ]; then
clear
echo -e " \e[32;1m#######################################################\e[0m"
echo -e " \e[32;3m##\e[0m              \e[31;3mPAYLOAD GAGAL DISIMPAN!\e[0m              \e[32;3m##\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mPilih Nomor:\e[0m"
continue
 else
clear
 sed -i "2s,.*,payload '$payload',g" /usr/bin/assh/profile.txt
echo -e " \e[32;1m#######################################################\e[0m"
echo -e " \e[32;3m##\e[0m             \e[33;1mSUKSES MENGGANTI PAYLOAD\e[0m              \e[32;3m##\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mPilih Nomor:\e[0m"
continue
fi
fi
if [ $no == "4" ]; then
sni=$(cat /usr/bin/assh/profile.txt|awk "NR==3"|awk -F "'" '{print $2}')
clear
echo -e " \e[32;1m#######################################################\e[0m"
echo -e " \e[32;1m##\e[0m       \e[35;1mPerbarui Mode Inject - Payload & BUG\e[0m        \e[32;1m##\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mGanti BUG SNI:\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mBUG SNI Sekarang:\e[0m \e[33;1m$sni\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mMasukkan BUG SNI:\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mKosongkan dan ENTER untuk kembali\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
read -p " ($time) " sni
 if [ -z "$sni" ]; then
clear
echo -e " \e[32;1m#######################################################\e[0m"
echo -e " \e[32;3m##\e[0m              \e[31;3mBUG SNI GAGAL DISIMPAN!\e[0m              \e[32;3m##\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mPilih Nomor:\e[0m"
continue
 else
clear
sed -i "3s,.*,sni '$sni',g" /usr/bin/assh/profile.txt
echo -e " \e[32;1m#######################################################\e[0m"
echo -e " \e[32;3m##\e[0m             \e[33;1mSUKSES MENGGANTI BUG SNI\e[0m              \e[32;3m##\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mPilih Nomor:\e[0m"
continue
fi
fi
if [ $no == "5" ]; then
clear
echo -e " \e[32;1m#######################################################\e[0m"
echo -e " \e[32;1m##\e[0m       \e[35;1mPerbarui Mode Inject - Payload & BUG\e[0m        \e[32;1m##\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mGanti Proxy Server:\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[33;1m1.\e[0m\e[32;1mXL        : 202.152.240.50:8080\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[33;1m2.\e[0m\e[32;1mAXIS      : 10.8.3.8:8080\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[33;1m3.\e[0m\e[32;1mTELKOMSEL : 10.1.89.130:8000\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[33;1m4.\e[0m\e[32;1mTHREE(3)  : 10.4.0.10:3128\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[33;1m5.\e[0m\e[32;1mINDOSAT   : 10.19.19.19:8080\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[33;1m6.\e[0m\e[32;1mProxy Manual (Contoh: 10.169.69.69:8080)\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[33;1m\e[0m\e[32;1mKosongkan dan ENTER untuk kembali\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
read -p " ($time) " pxy
 if [ -f $pxy ]; then
clear
echo -e " \e[32;1m#######################################################\e[0m"
echo -e " \e[32;3m##\e[0m            \e[31;3mPROXY SERVER GAGAL DISIMPAN!\e[0m           \e[32;3m##\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mPilih Nomor:\e[0m"
continue
fi
if [ $pxy -gt "6" ] || [ $pxy == "0" ] || [[ $pxy != *[[:digit:]]* ]]; then
clear
echo -e " \e[32;1m#######################################################\e[0m"
echo -e " \e[32;1m##\e[0m              \e[31;3mPILIH NOMOR DENGAN BENAR!\e[0m            \e[32;1m##\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mPilih Nomor:\e[0m"
continue
fi
 if [ $pxy == "1" ]; then
sed -i "4s,.*,ip '202.152.240.50:8080',g" /usr/bin/assh/profile.txt
sed -i "5s,.*,proxy '202.152.240.50',g" /usr/bin/assh/profile.txt
sed -i "6s,.*,port '8080',g" /usr/bin/assh/profile.txt
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mSukses merubah Proxy ke\e[0m \e[33;1m202.152.240.50\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mSukses merubah Port ke\e[0m \e[33;1m8080\e[0m"
 elif [ $pxy == "2" ]; then
sed -i "4s,.*,ip '10.8.3.8:8080',g" /usr/bin/assh/profile.txt
sed -i "5s,.*,proxy '10.8.3.8',g" /usr/bin/assh/profile.txt
sed -i "6s,.*,port '8080',g" /usr/bin/assh/profile.txt
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mSukses merubah Proxy ke\e[0m \e[33;1m10.8.3.8\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mSukses merubah Port ke\e[0m \e[33;1m8080\e[0m"
 elif [ $pxy == "3" ]; then
sed -i "4s,.*,ip '10.1.89.130:8000',g" /usr/bin/assh/profile.txt
sed -i "5s,.*,proxy '10.1.89.130',g" /usr/bin/assh/profile.txt
sed -i "6s,.*,port '8000',g" /usr/bin/assh/profile.txt
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mSukses merubah Proxy ke\e[0m \e[33;1m10.1.89.130\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mSukses merubah Port ke\e[0m \e[33;1m8000\e[0m"
 elif [ $pxy == "4" ]; then
sed -i "4s,.*,ip '10.4.0.10:3128',g" /usr/bin/assh/profile.txt
sed -i "5s,.*,proxy '10.4.0.10',g" /usr/bin/assh/profile.txt
sed -i "6s,.*,port '3128',g" /usr/bin/assh/profile.txt
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mSukses merubah Proxy ke\e[0m \e[33;1m10.4.0.10\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mSukses merubah Port ke\e[0m \e[33;1m3128\e[0m"
 elif [ $pxy == "5" ]; then
sed -i "4s,.*,ip '10.19.19.19:8080',g" /usr/bin/assh/profile.txt
sed -i "5s,.*,proxy '10.19.19.19',g" /usr/bin/assh/profile.txt
sed -i "6s,.*,port '8080',g" /usr/bin/assh/profile.txt
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mSukses merubah Proxy ke\e[0m \e[33;1m10.19.19.19\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mSukses merubah Port ke\e[0m \e[33;1m8080\e[0m"
 elif [ $pxy == "6" ]; then
clear
echo -e " \e[32;1m#######################################################\e[0m"
echo -e " \e[32;1m##\e[0m       \e[35;1mPerbarui Mode Inject - Payload & BUG\e[0m        \e[32;1m##\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mGanti Proxy Server:\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mKetik Proxy Manual (Contoh: 10.169.69.69:80)\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mKosongkan dan ENTER untuk kembali\e[0m"
 read -p " " sqy
  if [ -f $sqy ]; then
clear
echo -e " \e[32;1m#######################################################\e[0m"
echo -e " \e[32;3m##\e[0m            \e[31;3mPROXY SERVER GAGAL DISIMPAN!\e[0m           \e[32;3m##\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mPilih Nomor:\e[0m"
continue
fi
if [[ $sqy =~ ^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]):[0-9]+$ ]]; then
sed -i "4s,.*,ip '$sqy',g" /usr/bin/assh/profile.txt
cat /usr/bin/assh/profile.txt|awk "NR==4"|awk -F "'" '{print $2}' | sed -e "s/:/ /" | while read proxy port 
do
sed -i "5s,.*,proxy '$proxy',g" /usr/bin/assh/profile.txt
sed -i "6s,.*,port '$port',g" /usr/bin/assh/profile.txt
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mSukses merubah Proxy ke\e[0m \e[33;1m$proxy\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mSukses merubah Port ke\e[0m \e[33;1m$port\e[0m"
done
fi
if [[ ! $sqy =~ ^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]):[0-9]+$ ]]; then
clear
echo -e " \e[32;1m#######################################################\e[0m"
echo -e " \e[32;3m##\e[0m         \e[31;3mMASUKAN PROXY:PORT DENGAN BENAR!\e[0m        \e[32;3m##\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mPilih Nomor:\e[0m"
continue
 fi
 fi
if [ $no == "6" ]; then
clear
exit
fi
fi
exit
done
}
 setup () {
clear
echo -e " \e[32;1m#######################################################\e[0m"
echo -e " \e[32;1m##\e[0m          \e[35;1mMemperbarui Perlengkapan XDERM\e[0m           \e[32;1m##\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
echo
echo -e " \e[36;1mPastikan Persyaratan berikut terpenuhi:\e[0m"
while true; do
echo -e " \e[32;1m*******************************************************\e[0m"
echo -e " \e[36;1m3. Akan mengupdate, mengupgrade, dan menginstall dengan otomatis.\e[0m"
echo -e " \e[36;1m4. Pastikan Router tersambung dengan internet yang lancar.\e[0m"
echo -e " \e[36;1m5. Pastikan Router sudah EXROOT dan penyimpanan flasdisk diatas 1GB.\e[0m"
echo -e " \e[36;1m6. Tested only on Pulpstone Openwrt LEDE & Chaos Chalmer.\e[0m"
echo -e " \e[36;1m7. Jangan cabut/matikan router/koneksi internet saat proses sedang berlangsung.\e[0m"
echo -e " \e[36;1m8. Router/Koneksi mati saat proses berlangsung BERPOTENSI menyebabkan router BRICK.\e[0m"
echo -e " \e[36;1m8. Router akan reboot otomatis setelah update selesai.\e[0m"
echo -e " \e[32;1m*******************************************************\e[0m"
read -p " Are you sure you want to continue? <y/N> " prompt
	if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]; then
		echo -e " \e[36;1mProses sedang berlangsung...\e[0m"
		opkg update && opkg install python-pip screen redsocks coreutils-timeout openssl-util curl ncat openssh-client sshpass httping
		cek=$(uname -m)
			if [[ $cek == *"aarch64"* ]]; then
		                wget --no-check-certificate -N https://github.com/jakues/X-tunnel/raw/master/badvpn -P /usr/bin && chmod +x /usr/bin/badvpn
		                wget --no-check-certificate -N https://github.com/jakues/X-tunnel/raw/master/corkscrew -P /usr/bin && chmod +x /usr/bin/corkscrew

			fi
	else
		echo -e " \e[31;3m############## UPDATE TELAH DIBATALKAN! ###############\e[0m"
	fi
		exit 1
		done
}

 update () {
clear
echo -e " \e[32;1m#######################################################\e[0m"
echo -e " \e[32;1m##\e[0m             \e[35;1mUpdate XDERM versi terbaru\e[0m            \e[32;1m##\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
echo
while true; do
echo -e " \e[32;1m*******************************************************\e[0m"
echo -e " \e[36;1mProses update akan mereset profile dan akunssh anda.\e[0m"
echo -e " \e[32;1m*******************************************************\e[0m"
read -p " Are you sure you want to continue? <y/N> " prompt
	if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]; then
		wget --no-check-certificate -N https://github.com/jakues/X-tunnel/raw/master/x -P /usr/bin && chmod +x /usr/bin/x
		wget --no-check-certificate -N https://github.com/jakues/X-tunnel/raw/master/badvpn -P /usr/bin && chmod +x /usr/bin/badvpn
		wget --no-check-certificate -N https://github.com/jakues/X-tunnel/raw/master/corkscrew -P /usr/bin && chmod +x /usr/bin/corkscrew
		echo -e "                       \e[36;1mDownload selesai...\e[0m"
		echo
		exit
	else
		echo -e " \e[31;3m############## UPDATE TELAH DIBATALKAN! ###############\e[0m"
	fi
		exit
		done
}
 akunssh () {
clear
echo -e " \e[32;1m#######################################################\e[0m"
echo -e " \e[32;1m##\e[0m                 \e[35;1mUpdate SSH Account\e[0m                \e[32;1m##\e[0m"
echo -e " \e[32;1m#######################################################\e[0m"
time=$(date|awk -F ' ' '{print $4}')
echo -e " \e[36;1m($time)\e[0m \e[32;1mMasukkan IP/Host :\e[0m"
prip=$(cat /usr/bin/assh/akun.txt|awk "NR==4")
[[ -z $prip ]] || { time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mEnter untuk Skip (set to\e[0m \e[33;1m$prip\e[0m\e[32;1m)\e[0m"; }
read -p " ($time) " prips
[[ ! -z $prips ]] || { [[ -z $prip ]] || { prips=$prip; }; }
time=$(date|awk -F ' ' '{print $4}')
echo -e " \e[36;1m($time)\e[0m \e[32;1mMasukkan Port :\e[0m"
prpo=$(cat /usr/bin/assh/akun.txt|awk "NR==3")
[[ -z $prpo ]] || { time=$(date|awk -F ' ' '{print $4}')
echo -e " \e[36;1m($time)\e[0m \e[32;1mEnter untuk Skip (set to\e[0m \e[33;1m$prpo\e[0m\e[32;1m)\e[0m"; }
read -p " ($time) " prpos;[[ ! -z $prpos ]] || { [[ -z $prpo ]] || { prpos=$prpo; }; }
time=$(date|awk -F ' ' '{print $4}')
echo -e " \e[36;1m($time)\e[0m \e[32;1mMasukkan Nama Pengguna :\e[0m"
user=$(cat /usr/bin/assh/akun.txt|awk "NR==1")
[[ -z $user ]] || { time=$(date|awk -F ' ' '{print $4}')
echo -e " \e[36;1m($time)\e[0m \e[32;1mEnter untuk Skip (set to\e[0m \e[33;1m$user\e[0m\e[32;1m)\e[0m"; }
read -p " ($time) " users;[[ ! -z $users ]] || { [[ -z $user ]] || { users=$user; }; }
time=$(date|awk -F ' ' '{print $4}')
echo -e " \e[36;1m($time)\e[0m \e[32;1mMasukkan Kata Sandi :\e[0m"
pass=$(cat /usr/bin/assh/akun.txt|awk "NR==2");j=$(echo $pass|wc -c)
[[ $j != 2 ]] && { pss=$(echo $pass|head -c1);pss=$(echo "$pss*******"); } || { pss="*"; }
[[ -z $pass ]] || { time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mEnter untuk Skip (set to\e[0m \e[33;1m$pss\e[0m\e[32;1m)\e[0m"; }
read -p " ($time) " passs;[[ ! -z $passs ]] || { [[ -z $pass ]] || { passs=$pass; }; }

time=$(date|awk -F ' ' '{print $4}');echo -e " \e[36;1m($time)\e[0m \e[32;1mSelesai.\n";rm -rf /usr/bin/assh/a*
echo -e "$users\n$passs\n$prpos\n$prips" > /usr/bin/assh/akun.txt;exit
}
case "$1" in
 -akunssh|--akunssh|-a|--a)
akunssh
;;
 -check|--check|-c|--c)
check
;;
 -profile|--profile|-p|--p)
profile
;;
 -rules|--rules|-r|--r)
rules
;;
 -setup|--setup|-w|--w)
setup
;;
 -kickoff|--kickoff|-k|--k)
start
;;
 -stop|--stop|-s|--s)
stop
;;
 -finder|--finder|-f|--f)
finder
;;
 -update|-u|--u|--update)
update
;;
esac
clear
echo -e "\e[32;1m########################################################\e[0m"
echo -e "\e[32;1m##\e[0m         \e[35;1mDaftar Perintah XDERM SSH Launcher         \e[0m"
echo -e "\e[32;1m########################################################\e[0m"
echo -e "\e[32;1m##\e[0m \e[36;3mx -akunssh  \e[0m  \e[36;1m(Update Akun SSH)\e[0m        "
echo -e "\e[32;1m##\e[0m \e[36;3mx -check    \e[0m  \e[36;1m(BUG Host Checker)\e[0m       "
echo -e "\e[32;1m##\e[0m \e[36;3mx -profile  \e[0m  \e[36;1m(Update Mode Inject, Payload"
echo -e "\e[32;1m##\e[0m \e[36;3mx -rules    \e[0m  \e[36;1m(Add Rules IPtables)\e[0m     "
echo -e "\e[32;1m##\e[0m \e[36;3mx -setup    \e[0m  \e[36;1m(Update Requirement)\e[0m     "
echo -e "\e[32;1m##\e[0m \e[36;3mx -start    \e[0m  \e[36;1m(Mulai Menjalankan SSH)\e[0m  "
echo -e "\e[32;1m##\e[0m \e[36;3mx -stop     \e[0m  \e[36;1m(Hentikan Proses SSH)\e[0m    "
echo -e "\e[32;1m##\e[0m \e[36;3mx -finder   \e[0m  \e[36;1m(Cari IP > Mulai SSH)\e[0m    "
echo -e "\e[32;1m##\e[0m \e[36;3mx -update   \e[0m  \e[36;1m(Update XDERM versi terbaru)\e[0m"
echo -e "\e[32;1m########################################################\e[0m"
echo -e "              \e[33;1mCurrent versi 3.2 Beta-Final\e[0m"
echo -e "              \e[36;1mCopyright\e[0m\e[31;1m@\e[0m\e[34;1m FB\e[0m\e[31;1m:\e[0m"
echo
