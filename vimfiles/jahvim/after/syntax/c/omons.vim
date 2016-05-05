" $Id: omons.vim 33 2008-08-12 21:52:41Z jheddings $

if !exists("g:omons")
  finish
endif

""  check
syntax keyword omFunction fail fail_if fail_unless mark_point
syntax keyword omType Suite SRunner TCase
syntax keyword omMacro START_TEST END_TEST

""  utilc
syntax keyword omMacro ABS ASSERT CLIP FCC IS_EVEN IS_ODD MAX MIN VERIFY BITCLR BITGET BITSET
syntax keyword omMacro CAN_THROW NO_THROW RESTRICT_SCOPE EXTERN_CPP_END EXTERN_CPP_START
syntax keyword omMacro END_CHECK END_SUITE END_TEST END_TEST_CASE EXTERN_SUITE EXTERN_TEST RUN_SUITE START_CHECK START_SUITE START_TEST START_TEST_CASE
syntax keyword omFunction base64_decode base64_decode_len base64_decode_table_gen base64_encode base64_encode_len chomp chunk_split chunk_split_len
syntax keyword omFunction cmdline_getopt cmdline_usage gettime
syntax keyword omFunction bin2hex hex2bin hex2int int2hex randbytes randint strip
syntax keyword omFunction time_add time_add_usec time_compare time_sub time_sub_usec
syntax keyword omFunction url_alloc url_free url_parse url_decode url_encode
syntax keyword omFunction uuid_compare uuid_create uuid_fprint uuid_fprintf uuid_scan uuid_scanf uuid_sprint uuid_sprintf
syntax keyword omType bigint_t cmdline_opt DLibSymPtr BOOL INT16 INT32 INT64 INT8 IP_ADDRESS4 ipaddr_t IP_PORT sig_atomic_t SOCKET timeval_t UINT16 UINT32 UINT64 UINT8 uuid_t cgi_t url_t
syntax keyword omConstant kOptArgOptional kOptArgRequired kOptNoArgument
syntax keyword omConstant DIR_CHAR TRUE FALSE FOREVER INT16_MAX INT16_MIN INT32_MAX INT32_MIN UINT16_MAX UINT16_MIN UINT32_MAX UINT32_MIN UINT64_MAX UINT64_MIN INT64_MAX INT64_MIN PATH_CHAR PI RANDOM_MAX WAIT_FOREVER
syntax keyword omVariable cmdline_optarg cmdline_optidx

""  core
syntax keyword omMacro OM_THROW TRACE TRACEFN MUTEX_AUTOLOCK MUTEX_AUTOLOCK_T

" link to standard types
hi def link omType Type
hi def link omMacro Macro
hi def link omFunction Function
hi def link omVariable Constant
hi def link omConstant Constant
hi def link omStatement Statement
