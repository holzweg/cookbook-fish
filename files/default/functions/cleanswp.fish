function cleanswp --description 'Rm all swp files and derivatives.'
    find . \( -name "*.swp" -or -name "*.swo" -or -name "*.swp" -or -name "*.swn" \) -delete
end
