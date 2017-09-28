function fish_prompt
    test $SSH_TTY
    and printf (set_color white)$USER(set_color white)'@'(set_color white)(hostname|cut -d . -f 1)' '
    test $USER = 'root'
    and echo (set_color red)"# "

    echo -n (set_color white)(prompt_pwd)

    set last_status $status
    printf '%s ' (__fish_git_prompt)
    set_color normal

    echo -n (set_color white)'$ '
end
