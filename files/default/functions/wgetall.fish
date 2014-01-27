function wgetall --description 'Get entire tree over wget, sneaking as a non-crawler.'
    wget -E -H -K -k -p -r -w 20 -U Mozilla --limit-rate 20000
end
