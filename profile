# /etc/profile: system-wide .profile file for the Bourne shell (sh(1))
# and Bourne compatible shells (bash(1), ksh(1), ash(1), ...).

if [ "$PS1" ]; then
  if [ "$BASH" ] && [ "$BASH" != "/bin/sh" ]; then
    # The file bash.bashrc already sets the default PS1.
    # PS1='\h:\w\$ '
    if [ -f /etc/bash.bashrc ]; then
      . /etc/bash.bashrc
    fi
  else
    if [ "`id -u`" -eq 0 ]; then
      PS1='# '
    else
      PS1='$ '
    fi
  fi
fi

if [ -d /etc/profile.d ]; then
  for i in /etc/profile.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi
export JAVA_HOME=/usr/lib/jvm/java-8-oracle/
export LD_LIBRARY_PATH=/usr/lib/oracle/12.2/client64/lib/
export TNS_ADMIN=/home/sangbong/tns
export ANYPOINT=/home/sangbong/workspace/anypoint/
export XD_INSTALL_DIR=/home/sangbong/Downloads/spring-xd-1.3.1.RELEASE/
