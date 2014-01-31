function fish_greeting
    if test "blackbox" =  (hostname|cut -d . -f 1)
         fortune
     else
         cat /run/motd
     end
end
