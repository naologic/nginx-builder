declare -A NGINX_MODULES # where do I get the zip?
# some modules require extra custome work. 
# store a .sh in module_deps and declare it here with the same module name
# ex: ngx_brotli --> app/module_deps/ngx_brotli-install.sh (-install, -run, -update, -remove)

###
NGINX_MODULES['ngx_brotli']="https://github.com/google/ngx_brotli/zipball/master"
NGINX_MODULES['ngx_headers_more']="https://github.com/openresty/headers-more-nginx-module/zipball/master" #- Set, add, and clear arbitrary output headers. 
NGINX_MODULES['ngx_mod_zip']="https://github.com/evanmiller/mod_zip/zipball/master"
NGINX_MODULES['ngx_rtmp']="https://github.com/arut/nginx-rtmp-module/zipball/master" #- NGINX-based Media Streaming Server.
NGINX_MODULES['ngx_set_misc']="https://github.com/agentzh/set-misc-nginx-module/zipball/master"
NGINX_MODULES['ngx_xss']="https://github.com/openresty/xss-nginx-module/zipball/master" #- Native support for cross-site scripting ="XSS" in an nginx.
NGINX_MODULES['ngx_srcache']="https://github.com/openresty/srcache-nginx-module/zipball/master" #- Transparent subrequest-based caching layout for arbitrary nginx locations. 
NGINX_MODULES['ngx_replace_filter']="https://github.com/openresty/replace-filter-nginx-module/zipball/master" #- Streaming regular expression replacement in response bodies. 
NGINX_MODULES['ngx_echo']="https://github.com/openresty/echo-nginx-module/zipball/master" #- An Nginx module for bringing the power of "echo", "sleep", "time" and more to Nginx's config file. 
NGINX_MODULES['ngx_encrypted_session']="https://github.com/openresty/encrypted-session-nginx-module/zipball/master" #- encrypt and decrypt nginx variable values. 
NGINX_MODULES['ngx_drizzle']="https://github.com/openresty/drizzle-nginx-module/zipball/master" #- an nginx upstream module that talks to mysql and drizzle by libdrizzle. 
NGINX_MODULES['ngx_array_var']="https://github.com/openresty/array-var-nginx-module/zipball/master" #- Add support for array-typed variables to nginx config files.
NGINX_MODULES['ngx_set_misc']="https://github.com/openresty/set-misc-nginx-module/zipball/master" #- Various set_xxx directives added to nginx's rewrite module ="md5/sha1, sql/json quoting, and many more). 
NGINX_MODULES['ngx_pagespeed']="https://github.com/pagespeed/ngx_pagespeed/zipball/master" #- Automatic PageSpeed optimization module for Nginx. 
NGINX_MODULES['ngx_devel_kit']="https://github.com/simpl/ngx_devel_kit/zipball/master" #- Nginx Development Kit #- an Nginx module that adds additional generic tools that module developers can use in their own modules.
NGINX_MODULES['ngx_cache_purge']="https://github.com/FRiCKLE/ngx_cache_purge/zipball/master" #- nginx module which adds ability to purge content from FastCGI, proxy, SCGI and uWSGI caches. 
NGINX_MODULES['ngx_http_concat']="https://github.com/alibaba/nginx-http-concat/zipball/master" #- A Nginx module for concatenating files in a given context: CSS and JS files usually.
NGINX_MODULES['ngx_http_user_agent']="https://github.com/alibaba/nginx-http-user-agent/zipball/master" #- A nginx module to match browsers and crawlers. 
NGINX_MODULES['ngx_http_sysguard']="https://github.com/alibaba/nginx-http-sysguard/zipball/master" #- A Nginx module to protect servers when system load or memory use goes too high.
NGINX_MODULES['ngx_tfs']="https://github.com/alibaba/nginx-tfs/zipball/master" #- An Asynchronous Nginx module providing a RESTful API for TFS ="Taobao File System). 
NGINX_MODULES['ngx_http_slice']="https://github.com/alibaba/nginx-http-slice/zipball/master" #- Nginx module for serving a file in slices ="reverse byte-range). 
NGINX_MODULES['ngx_backtrace']="https://github.com/alibaba/nginx-backtrace/zipball/master" #- A Nginx module to dump backtrace when a worker process exits abnormally. 
NGINX_MODULES['ngx_http_footer_filter']="https://github.com/alibaba/nginx-http-footer-filter/zipball/master" #- A nginx module that prints some text in the footer of a request.
NGINX_MODULES['ngx_clojure']="https://github.com/nginx-clojure/nginx-clojure/zipball/master" #- Nginx module for embedding Clojure or Java or Groovy programs, typically those Ring based handlers.
NGINX_MODULES['ngx_audio_track_for_hls']="https://github.com/flavioribeiro/nginx-audio-track-for-hls-module/zipball/master" #- Nginx module that generates audio track for HTTP Live Streaming ="HLS" streams on the fly. 
NGINX_MODULES['ngx_access_plus']="https://github.com/nginx-clojure/nginx-access-plus/zipball/master" #- nginx module allows limiting access to certain http request methods and client addresses.

# Databases and Connectors
NGINX_MODULES['ngx_eval']="https://github.com/vkholodkov/nginx-eval-module/zipball/master" #- A module for evaluating memcached or proxy response into variable.
NGINX_MODULES['ngx_ench_memcache']="https://github.com/bpaquet/ngx_http_enhanced_memcached_module/zipball/master"
NGINX_MODULES['ngx_memc']="https://github.com/openresty/memc-nginx-module/zipball/master" #- An extended version of the standard memcached module that supports set, add, delete, and many more memcached commands.. 
NGINX_MODULES['ngx_redis2']="https://github.com/openresty/redis2-nginx-module/zipball/master" #- Nginx upstream module for the Redis 2.0 protocol. 
NGINX_MODULES['ngx_mongo']="https://github.com/simpl/ngx_mongo/zipball/master"
NGINX_MODULES['ngx_postgres']="https://github.com/FRiCKLE/ngx_postgres/zipball/master" #- upstream module that allows nginx to communicate directly with PostgreSQL database.
NGINX_MODULES['ngx_couchbase']="https://github.com/couchbaselabs/couchbase-nginx-module/zipball/master" #- The module for nginx webserver to access Couchbase Server. 
NGINX_MODULES['ngx_aws_auth']="https://github.com/anomalizer/ngx_aws_auth/zipball/master" #- nginx module to proxy to authenticated AWS services.
NGINX_MODULES['ngx_zeromq']="https://github.com/FRiCKLE/ngx_zeromq" #- ZeroMQ transport for nginx. 
NGINX_MODULES['ngx_auth_ldap']="https://github.com/kvspb/nginx-auth-ldap" #- LDAP authentication module for nginx. 

# Friewall
NGINX_MODULES['ngx_naxsi']="https://github.com/nbs-system/naxsi/zipball/master" #- NAXSI is an open-source, high performance, low rules maintenance WAF for NGINX. 

# Transformers
NGINX_MODULES['ngx_small_light']="https://github.com/cubicdaiya/ngx_small_light/zipball/master" #- Dynamic Image Transformation Module For nginx. 
NGINX_MODULES['ngx_http_gif_magick']="https://github.com/mschenck/ngx_http_gif_magick/zipball/master" #- nginx http filter module for dynamically resizing gifs with ImageMagick. 
NGINX_MODULES['ngx_gm_filter']="https://github.com/liseen/ngx-gm-filter/zipball/master" #- Another image filter based GraphicsMagick.. 
NGINX_MODULES['ngx_rds_csv']="https://github.com/openresty/rds-csv-nginx-module/zipball/master" #- Nginx output filter module to convert Resty-DBD-Streams ="RDS" to Comma-Separated Values ="CSV). 

# Load Balancers
NGINX_MODULES['ngx_upstream_fair']="https://github.com/gnosek/nginx-upstream-fair/zipball/master" #- The fair load balancer module for nginx.

##
NGINX_MODULES['ngx_push_stream']="https://github.com/wandenberg/nginx-push-stream-module/zipball/master" #- A pure stream http push technology for your Nginx setup. Comet made easy and really scalable.
NGINX_MODULES['ngx_vts']="https://github.com/vozlt/nginx-module-vts/zipball/master" #- Nginx virtual host traffic status module. 
NGINX_MODULES['ngx_url']="https://github.com/vozlt/nginx-module-url/zipball/master" #- Nginx url encoding converting module.
NGINX_MODULES['ngx_session_binding_proxy']="https://github.com/wburgers/Session-Binding-Proxy/zipball/master" #- An Nginx module capable of binding the application session to the SSL session by encrypting the application cookie with a secret key and the SSL master key. 
NGINX_MODULES['ngx_upload_progress_module']="https://github.com/masterzen/nginx-upload-progress-module/zipball/master" #- Nginx module implementing an upload progress system, that monitors RFC1867 POST uploads as they are transmitted to upstream servers. 
NGINX_MODULES['ngx_protobuf_nginx']="https://github.com/dbcode/protobuf-nginx/zipball/master" #- Google Protocol Buffers code generator for nginx module developers. 


## NON AUTOMATIC MODULES:: NEED HANDLING
NGINX_MODULES['ngx_modSecurity']="https://github.com/SpiderLabs/ModSecurity/tree/master/nginx/modsecurity" #- ModSecurity is an open source, cross platform web application firewall ="WAF" engine for Apache, IIS and Nginx that is developed by Trustwave's SpiderLabs. 


###Lua Modules
# Databases and Connectors in Lua
NGINX_MODULES['ngx_lua']="https://github.com/openresty/lua-nginx-module/zipball/master"
NGINX_MODULES['lua_resty_http']="https://github.com/pintsized/lua-resty-http/zipball/master" #- Lua HTTP client cosocket driver for OpenResty / ngx_lua. 
NGINX_MODULES['lua_resty_redis']="https://github.com/openresty/lua-resty-redis/zipball/master" #- Lua redis client driver for the ngx_lua based on the cosocket API. 
NGINX_MODULES['lua_resty_memcached']="https://github.com/openresty/lua-resty-memcached/zipball/master" #- Lua memcached client driver for the ngx_lua based on the cosocket API. 
NGINX_MODULES['lua_resty_mysql']="https://github.com/openresty/lua-resty-mysql/zipball/master" #- Nonblocking Lua MySQL driver library for ngx_lua. 
NGINX_MODULES['lua_resty_postgres']="https://github.com/azurewang/lua-resty-postgres/zipball/master" #- Nonblocking Lua PostgreSQL driver library for ngx_lua. 
NGINX_MODULES['lua_resty_cassandra']="https://github.com/jbochi/lua-resty-cassandra/zipball/master" #- Pure Lua Cassandra client using CQL binary protocol.
NGINX_MODULES['lua_resty_mongol']="https://github.com/Olivine-Labs/resty-mongol/zipball/master" #- Lua MongoDB driver. 
NGINX_MODULES['lua_resty_oceanbase']="https://github.com/hugozhu/lua-resty-oceanbase/zipball/master" #- Lua OceanBase client driver for ngx_lua based on the cosocket API.
NGINX_MODULES['lua_resty_hmac']="https://github.com/jkeys089/lua-resty-hmac/zipball/master" #- HMAC functions for ngx_lua and LuaJIT.
NGINX_MODULES['lua_resty_jwt']="https://github.com/SkyLothar/lua-resty-jwt/zipball/master" #- JWT For The Great Openresty. 
NGINX_MODULES['lua_resty_upstream_healthcheck']="https://github.com/openresty/lua-resty-upstream-healthcheck/zipball/master" #- Health Checker for Nginx Upstream Servers in Pure Lua. 
NGINX_MODULES['lua_resty_riak']="https://github.com/bakins/lua-resty-riak/zipball/master" #- Lua riak protocol buffer client driver for the ngx_lua based on the cosocket API.
NGINX_MODULES['lua_resty_ssdb']="https://github.com/LazyZhu/lua-resty-ssdb/zipball/master" #- Lua ssdb client driver for the ngx_lua based on the cosocket API, SSDB is a leveldb server. 
NGINX_MODULES['lua_resty_kafka']="https://github.com/doujiang24/lua-resty-kafka/zipball/master" #- Lua kafka client driver for the ngx_lua based on the cosocket API.
NGINX_MODULES['lua_resty_rabbitmqstomp']="https://github.com/wingify/lua-resty-rabbitmqstomp/zipball/master" #- Opinionated Lua RabbitMQ client library for the ngx_lua apps based on the cosocket API. 
NGINX_MODULES['lua_resty_gearman']="https://github.com/zhhchen/lua-resty-gearman/zipball/master" #- Lua gearman client driver for the ngx_lua based on the cosocket API.
NGINX_MODULES['lua_resty_fastcgi']="https://github.com/benagricola/lua-resty-fastcgi/zipball/master" #- Lua FCGI client driver for ngx_lua based on the cosocket API. 
NGINX_MODULES['lua_resty_upload']="https://github.com/openresty/lua-resty-upload/zipball/master" #- Streaming reader and parser for http file uploading based on ngx_lua cosocket.




# [lua-resty-fastdfs]="https://github.com/azurewang" #- Nonblocking Lua FastDFS driver library for ngx_lua.
# [lua-resty-lrucache]="https://github.com/openresty/lua-resty-lrucache" #- Lua-land LRU Cache based on LuaJIT FFI. 
# [lua-resty-core]="https://github.com/openresty/lua-resty-core" #- New FFI-based API for lua-nginx-module. 
# [lua-redis-parser]="https://github.com/openresty/lua-redis-parser" #- Lua module for parsing raw redis responses. 
# [lua-resty-websocket]="https://github.com/openresty/lua-resty-websocket" #- WebSocket support for the ngx_lua module (and OpenResty). 
# [lua-resty-dns]="https://github.com/openresty/lua-resty-dns" #- DNS resolver for the nginx lua module.
# [lua-resty-string]="https://github.com/openresty/lua-resty-string" #- String utilities and common hash functions for ngx_lua and LuaJIT.
# [lua-rds-parser]="https://github.com/openresty/lua-rds-parser" #- Resty DBD Stream (RDS" parser for Lua written in C.
# [lua-resty-template]="https://github.com/bungle/lua-resty-template" #- Templating Engine (HTML" for Lua and OpenResty
# [lua-resty-cookie]="https://github.com/cloudflare/lua-resty-cookie" #- Lua library for HTTP cookie manipulations for OpenResty/ngx_lua. 
# [lua-resty-logger-socket]="https://github.com/cloudflare/lua-resty-logger-socket" #- Raw-socket-based Logger Library for Nginx.
# [lua-resty-beanstalkd]="https://github.com/smallfish/lua-resty-beanstalkd" #- non-blocking beanstalkd client lib for ngx_lua. 
# [lua-resty-libcjson]="https://github.com/bungle/lua-resty-libcjson" #- LuaJIT FFI-based cJSON library for OpenResty. 
# [lua-resty-session]="https://github.com/bungle/lua-resty-session" #- Session library for OpenResty implementing Secure Cookie Protocol.
# [lua-resty-validation]="https://github.com/bungle/lua-resty-validation" #- Validation Library (Input Validation and Filtering" for Lua and OpenResty. 
# [lua-resty-random]="https://github.com/bungle/lua-resty-random" #- LuaJIT FFI-based Random Library for OpenResty.
# [lua-resty-scrypt]="https://github.com/bungle/lua-resty-scrypt" #- LuaJIT FFI-based scrypt library for OpenResty. 
# [lua-resty-uuid]="https://github.com/bungle/lua-resty-uuid" #- LuaJIT FFI bindings for libuuid, a DCE compatible Universally Unique Identifier library.
# [lua-resty-hoedown]="https://github.com/bungle/lua-resty-hoedown" #- LuaJIT FFI bindings to Hoedown, a standards compliant, fast, secure markdown processing library in C.
# [lua-resty-snappy]="https://github.com/bungle/lua-resty-snappy" #- LuaJIT FFI bindings for Snappy, a fast compressor/decompressor. 
# [lua-resty-nettle]="https://github.com/bungle/lua-resty-nettle" #- LuaJIT FFI bindings for Nettle (a low-level cryptographic library).
# [lua-resty-rack]="https://github.com/pintsized/lua-resty-rack" #- A simple and extensible HTTP server framework for OpenResty.
# [lua-resty-upstream]="https://github.com/hamishforbes/lua-resty-upstream" #- Upstream connection load balancing and failover module for Openresty.
# [lua-resty-dns-cache]="https://github.com/hamishforbes/lua-resty-dns-cache" #- Cache wrapper for lua-resty-dns. 
# [lua-resty-consul]="https://github.com/hamishforbes/lua-resty-consul" #- Library to interface with the consul HTTP API from ngx_lua.
# [lua-resty-shell]="https://github.com/juce/lua-resty-shell" #- tiny subprocess/shell library to use with OpenResty application server.
# [lua-resty-rsa]="https://github.com/doujiang24/lua-resty-rsa" #- RSA encrypt/decrypt & sign/verify for LuaJIT.
# [lua-resty-smtp]="https://github.com/duhoobo/lua-resty-smtp" #- I must be crazy trying to send mail with Nginx.. 
# [lua-resty-iputils]="https://github.com/bakins/lua-resty-riak" #- Utility functions for working with IP addresses in Openresty. 
# [lua-resty-qless]="https://github.com/pintsized/lua-resty-qless" #- Lua binding to Qless (Queue / Pipeline management" for OpenResty.
# [lua-resty-kyototycoon]="https://github.com/cloudflare/lua-resty-kyototycoon" #- Lua client driver for KyotoTycoon using its native wire protocol (OpenResty/ngx_lua).
# [lua-resty-libxl]="https://github.com/bungle/lua-resty-libxl" #- LuaJIT FFI-based LibXL (Excel" library for OpenResty.
# [lua-resty-gettext]="https://github.com/bungle/lua-resty-gettext" #- LuaJIT FFI-based gettext library for OpenResty.
# [lua-resty-github]="https://github.com/jamesmarlowe/lua-resty-github" #- Lua library for using the github api in the ngx_lua nginx module.
# [lua-resty-murmurhash2]="https://github.com/bungle/lua-resty-murmurhash2" #- LuaJIT MurmurHash 2 bindings to Nginx / OpenResty murmurhash2 implementation.
# [lua-resty-hipchat]="https://github.com/jamesmarlowe/lua-resty-hipchat" #- Lua library for using the hipchat api.
# [lua-resty-readurl]="https://github.com/jamesmarlowe/lua-resty-readurl" #- Lua library for capturing urls, decoding, and logging results.
# [lua-resty-kyototycoon]="https://github.com/sjnam/lua-resty-kyototycoon" #- kyototycoon's binary protocol.
# [lua-resty-mobile]="https://github.com/isage/lua-resty-mobile" #- Mobile detection for nginx/openresty.
# [lua-resty-fileinfo]="https://github.com/bungle/lua-resty-fileinfo" #- LuaJIT FFI bindings to libmagic, magic number recognition library - tries to determine file types.
# [lua-resty-sass]="https://github.com/bungle/lua-resty-sass" #- LuaJIT FFI bindings for libsass - A C/C++ implementation of a Sass compiler.
# [lua-resty-taglib]="https://github.com/bungle/lua-resty-taglib" #- LuaJIT FFI bindings for TagLib - An Audio Meta-Data Library.
# [lua-resty-woothee]="https://github.com/woothee/lua-resty-woothee" #- Woothee Lua-Openresty implementation.
# [lua-resty-json]="https://github.com/cloudflare/lua-resty-json" #- json lib for lua and C.
# [ngx_lua_waf]="https://github.com/loveshell/ngx_lua_waf" #- lua waf based on ngx_lua.
# [lua-resty-limit-req]="https://github.com/timebug/lua-resty-limit-req" #- Limit the request processing rate between multiple NGINX instances. 
# [LuaWeb]="https://github.com/torhve/LuaWeb" #- A very simple blog engine using openresty, nginx, lua, markdown, git and redis.
# [lua-nginx-osm]="https://github.com/miurahr/lua-nginx-osm" #- OpenStreetMap extension for Nginx Lua module. 
# [nginx-tcp-lua-module]="https://github.com/bigplum/nginx-tcp-lua-module" #- A TCP server with lua supporting based on nginx.
# [nginx-google-oauth]="https://github.com/agoragames/nginx-google-oauth" #- Lua module to add Google OAuth to nginx. 
# [lua-upstream-nginx-module]="https://github.com/openresty/lua-upstream-nginx-module" #- Nginx C module to expose Lua API to ngx_lua for Nginx upstreams.
# [lua-resty-lock]="https://github.com/openresty/lua-resty-lock" #- Simple nonblocking lock API for ngx_lua based on shared memory dictionaries. 



##Tools
# [nginx-devel-utils]="https://github.com/openresty/nginx-devel-utils" #- Utilities for nginx module development. 
# [no-pool-nginx]="https://github.com/openresty/no-pool-nginx" #- replace nginx's pool mechanism with plain malloc & free to help tools like valgrind. 
# [nginx-dtrace]="https://github.com/openresty/nginx-dtrace" #- An nginx fork that adds dtrace USDT probes. 
# [test-nginx]="https://github.com/openresty/test-nginx" #- Data-driven test scaffold for Nginx C module and OpenResty Lua library development. 
# [nginx-systemtap-toolkit]="https://github.com/openresty/nginx-systemtap-toolkit" #- Real-time analyzing and diagnosing tools for Nginx based on SystemTap. 
# [nginx-gdb-utils]="https://github.com/openresty/nginx-gdb-utils" #- GDB Utilities for Nginx, ngx_lua, LuaJIT, and etc. 
# [apache2nginx]="https://github.com/nhnc-nginx/apache2nginx" #- A command line tool, which can be used to generate nginx config file according to given config files of Apache. 
# [nginx-build]="https://github.com/cubicdaiya/nginx-build" #- seamless nginx builder. 
# [puppet-nginx]="https://github.com/jfryman/puppet-nginx" #- Puppet Module to manage NGINX on various UNIXes. 
# [server-configs-nginx]="https://github.com/h5bp/server-configs-nginx" #- Nginx HTTP server boilerplate configs. 
# [nginx-boilerplate]="https://github.com/Umkus/nginx-boilerplate" #- Awesome Nginx configuration template. 
# [ngxtop]="https://github.com/lebinh/ngxtop" #- Real-time metrics for nginx server. 
# [nginx-conf]="https://github.com/lebinh/nginx-conf" #- A collection of useful Nginx configuration snippets. 
# [libngxcore]="https://github.com/cubicdaiya/libngxcore" #- libngxcore is the library built from nginx core APIs.. 
# [nginx-cache-purge]="https://github.com/perusio/nginx-cache-purge" #- A bash script for deleting items from Nginx cache. 
# [ngx-admintools]="https://github.com/rmacd/ngx-admintools" #- Debian Administration Tools for nginx web server. 
# [nginx-config-formatter]="https://github.com/1connect/nginx-config-formatter" #- Nginx config file formatter/beautifier written in Python.



# NGINX_MODULES[ngx_http_subrange_module]="https://github.com/Qihoo360/ngx_http_subrange_module" #- Split one big HTTP/Range request to multiple subrange requesets. 
# NGINX_MODULES[nginx_tcp_proxy_module]="https://github.com/yaoweibin/nginx_tcp_proxy_module" #- add the feature of tcp proxy with nginx, with health check and status monitor.
# NGINX_MODULES[nginx_ajp_module]="https://github.com/yaoweibin/nginx_ajp_module" #- support AJP protocol proxy with Nginx. 
# NGINX_MODULES[ngx_http_substitutions_filter_module]="https://github.com/yaoweibin/ngx_http_substitutions_filter_module" #- a filter module which can do both regular expression and fixed string substitutions for nginx.
# NGINX_MODULES[nginx-sticky-module]="https://github.com/yaoweibin/nginx-sticky-module" #- A nginx module to add an upstream server persistance using cookies. 
# NGINX_MODULES[nginx_mod_akamai_g2o]="https://github.com/refractalize/nginx_mod_akamai_g2o" #- Nginx Module for Authenticating Akamai G2O requests. 
# NGINX_MODULES[ngx_supervisord]="https://github.com/FRiCKLE/ngx_supervisord" #- nginx module providing API to communicate with supervisord and manage ="start/stop" backends on-demand.
# NGINX_MODULES[ngx_http_google_filter_module]="https://github.com/cuber/ngx_http_google_filter_module" #- Nginx Module for Google Mirror. 
# NGINX_MODULES[ngx_http_dyups_module]="https://github.com/yzprofile/ngx_http_dyups_module" #- update upstreams' config by restful interface.
# NGINX_MODULES[ngx_sync_msg_module]="https://github.com/yzprofile/ngx_sync_msg_module" #- This module provides a mechanism to sync messages between workers for your module. 
# NGINX_MODULES[nginx-upload-module]="https://github.com/vkholodkov/nginx-upload-module/tree/2.2" #- A module for nginx web server for handling file uploads using multipart/form-data encoding ="RFC 1867).
# NGINX_MODULES[nginx-video-thumbextractor-module]="https://github.com/wandenberg/nginx-video-thumbextractor-module" #- Nginx module to extract thumbs from a video file. 
# NGINX_MODULES[nginx-fluentd-module]="https://github.com/fluent/nginx-fluentd-module" #- Nginx module for Fluentd data collector.
# NGINX_MODULES[ngx_cache_viewer]="https://github.com/agile6v/ngx_cache_viewer" #- nginx module which adds ability to view cache node info from FastCGI, proxy, SCGI and uWSGI caches.
# NGINX_MODULES[nginx_http_push_module]="https://github.com/slact/nginx_http_push_module" #- Turn NGiNX into an adept HTTP push server. 
# NGINX_MODULES[nginx-selective-cache-purge-module]="https://github.com/wandenberg/nginx-selective-cache-purge-module" #- A module to purge cache by GLOB patterns.. 
# NGINX_MODULES[testcookie-nginx-module]="https://github.com/kyprizel/testcookie-nginx-module" #- simple robot mitigation module using cookie based challenge/response technique. 
# NGINX_MODULES[nginx_circle_gif]="https://github.com/evanmiller/nginx_circle_gif" #- this module generates simple circle images with the colors and size specified in the URL. 
# NGINX_MODULES[ngx_http_estreaming_module]="https://github.com/whatvn/ngx_http_estreaming_module" #- An adaptive hls streaming module for nginx. 
# NGINX_MODULES[ngx_mruby]="https://github.com/matsumoto-r/ngx_mruby" #- ngx_mruby #- A Fast and Memory-Efficient Web Server Extension Mechanism Using Scripting Language mruby for nginx. 
# NGINX_MODULES[ngx_http_geoip2_module]="https://github.com/leev/ngx_http_geoip2_module" #- creates variables with values from the maxmind geoip2 databases based on the client IP ="supports both IPv4 and IPv6). 
# NGINX_MODULES[tcp-nginx-module]="https://github.com/laocai/tcp-nginx-module" #- Use nginx as a common TCP server framework. 
# NGINX_MODULES[ngx_openresty]="https://github.com/openresty/ngx_openresty" #- Turning Nginx into a Full-fledged Web App Server. 
# NGINX_MODULES[iconv-nginx-module]="https://github.com/calio/iconv-nginx-module" #- a character conversion nginx module using libiconv. 
# NGINX_MODULES[form-input-nginx-module]="https://github.com/calio/form-input-nginx-module" #- This is a nginx module that reads HTTP POST and PUT request body encoded in "application/x-www-form-urlencoded", and parse the arguments in request body into nginx variables.. 
# NGINX_MODULES[ngx-ip2location]="https://github.com/chaizhenhua/ngx-ip2location" #- Nginx IP2Location Module. 
# NGINX_MODULES[nginx-hmux-module]="https://github.com/wangbin579/nginx-hmux-module" #- The module implements resin's hmux protocol in nginx. 
# NGINX_MODULES[nginx_ocsp_proxy-module]="https://github.com/kyprizel/nginx_ocsp_proxy-module" #- Nginx OCSP processing module designed for response caching. 
# NGINX_MODULES[nginx-hmac-secure-link]="https://github.com/nginx-modules/nginx-hmac-secure-link" #- Alternative Nginx secure link module with support for MD5, SHA-1, and SHA-2 hashes. 
# NGINX_MODULES[nginx-mod-so]="https://github.com/hamano/nginx-mod-so" #- nginx_mod_so is dynamic loadable module for Nginx. 
# NGINX_MODULES[nginx-xsltproc-module]="https://github.com/yoreek/nginx-xsltproc-module" #- XSLT processor bases on Nginx. 
# NGINX_MODULES[nginx-dlg-auth]="https://github.com/algermissen/nginx-dlg-auth" #- NGINX module for delegating authentication and authorization to an HTTP gateway. 
# NGINX_MODULES[ngx_http_qqwry_module]="https://github.com/anjuke/ngx_http_qqwry_module" #- A nginx module that creates variables with location info from QQWry. 
# NGINX_MODULES[nginx-markdown-module]="https://github.com/gabrielfalcao/nginx-markdown-module" #- renderize markdown as HTML directly from your upstream server. 
# NGINX_MODULES[nginx-nonewlines]="https://github.com/vedang/nginx-nonewlines" #- This is an nginx module to strip the served HTML of all newlines ="\n and \r characters). 
# NGINX_MODULES[nginx-udplog-module]="https://github.com/vkholodkov/nginx-udplog-module" #- Implementation of logging using BSD Syslog Protocol for nginx ="RFC 3164). 
# NGINX_MODULES[nginx-fancyindex]="https://github.com/damm/nginx-fancyindex" #- nginx fancy index module. 
# NGINX_MODULES[nginx_ipset_blacklist]="https://github.com/Vasfed/nginx_ipset_blacklist" #- nginx module to use linux netfilter ipsets as blacklists. 
# NGINX_MODULES[nginx-mogilefs-module]="https://github.com/vkholodkov/nginx-mogilefs-module" #- MogileFS client for nginx. 
# NGINX_MODULES[ngx_http_php_session]="https://github.com/replay/ngx_http_php_session" #- nginx module to parse php sessions. 
# NGINX_MODULES[ngx_trace]="https://github.com/zzzcpan/ngx_trace" #- runtime call tracer for nginx. 
# NGINX_MODULES[nginx-qrcode]="https://github.com/alexchamberlain/nginx-qrcode" #- Native QR encoding for Nginx Web Server. 
# NGINX_MODULES[nginx-dav-ext-module]="https://github.com/arut/nginx-dav-ext-module" #- NGINX WebDAV missing methods support ="PROPFIND & OPTIONS). 
# NGINX_MODULES[nginx-gridfs]="https://github.com/mdirolf/nginx-gridfs" #- Nginx module for serving files from MongoDB's GridFS. 
