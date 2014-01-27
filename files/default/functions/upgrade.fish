function upgrade --description 'Autoclean followed by source update followed by aptitude safe-upgrade'
    sudo aptitude -v autoclean;
    and sudo aptitude update;
    and sudo aptitude -v --show-why safe-upgrade;
end
