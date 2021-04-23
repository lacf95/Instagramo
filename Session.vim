let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Development/instagramo
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +111 Gemfile.lock
badd +56 Dockerfile
badd +23 Gemfile
badd +3 db/migrate/20210417012732_create_users.rb
badd +12 app/models/user.rb
badd +11 app/controllers/application_controller.rb
badd +1 db/migrate/20210417013221_create_posts.rb
badd +16 app/models/post.rb
badd +5 config/routes.rb
badd +7 app/controllers/posts_controller.rb
badd +1 app/views/posts/index.html.erb
badd +1 config/storage.yml
badd +3 app/views/posts/new.html.erb
badd +4 app/views/posts/show.html.erb
badd +75 config/environments/development.rb
badd +2 config/initializers/mini_profiler.rb
badd +2 config/initializers/mime_types.rb
badd +170 config/initializers/pagy.rb
badd +15 app/helpers/application_helper.rb
badd +5 app/views/posts/_post.html.erb
badd +18 app/views/layouts/application.html.erb
badd +1 app/assets/stylesheets/application.css
badd +45 app/javascript/styles/application.css
badd +13 app/javascript/packs/application.js
badd +3 db/migrate/20210420163953_add_colorscore_to_posts.rb
badd +12 config/application.rb
badd +6 app/analyzers/colorscore_analyzer.rb
badd +2 app/services/service.rb
badd +4 config/initializers/active_storage_analyzers.rb
badd +1 db/schema.rb
badd +2 app/javascript/lazy_load_images.js
badd +3 config/initializers/application_controller_renderer.rb
badd +1 app/models/application_record.rb
badd +19 app/controllers/sessions_controller.rb
badd +4 app/views/sessions/new.html.erb
badd +3 db/migrate/20210423005410_add_password_to_users.rb
badd +3 db/migrate/20210423013107_changes_user_passwords.rb
argglobal
%argdel
edit app/controllers/sessions_controller.rb
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 19 - ((18 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
19
normal! 013|
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOF
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
