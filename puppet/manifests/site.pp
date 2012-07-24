import "base"


node 'oren.jorgebastida.com' inherits basenode {
    include nginx
    include munin
    include nfs
    include samba

}
