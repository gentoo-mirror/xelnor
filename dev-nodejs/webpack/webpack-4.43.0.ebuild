# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit xel-nodejs

WEBPACK_CLI_VERSION="3.3.12"

DESCRIPTION="A bundler for javascript and friends"
HOMEPAGE="https://webpack.js.org"
SRC_URI="https://registry.npmjs.org/webpack/-/${P}.tgz
https://registry.npmjs.org/webpack-cli/-/webpack-cli-${WEBPACK_CLI_VERSION}.tgz
https://registry.npmjs.org/@webassemblyjs/ast/-/ast-1.9.0.tgz -> @webassemblyjs@ast-1.9.0.tgz
https://registry.npmjs.org/@webassemblyjs/floating-point-hex-parser/-/floating-point-hex-parser-1.9.0.tgz -> @webassemblyjs@floating-point-hex-parser-1.9.0.tgz
https://registry.npmjs.org/@webassemblyjs/helper-api-error/-/helper-api-error-1.9.0.tgz -> @webassemblyjs@helper-api-error-1.9.0.tgz
https://registry.npmjs.org/@webassemblyjs/helper-buffer/-/helper-buffer-1.9.0.tgz -> @webassemblyjs@helper-buffer-1.9.0.tgz
https://registry.npmjs.org/@webassemblyjs/helper-code-frame/-/helper-code-frame-1.9.0.tgz -> @webassemblyjs@helper-code-frame-1.9.0.tgz
https://registry.npmjs.org/@webassemblyjs/helper-fsm/-/helper-fsm-1.9.0.tgz -> @webassemblyjs@helper-fsm-1.9.0.tgz
https://registry.npmjs.org/@webassemblyjs/helper-module-context/-/helper-module-context-1.9.0.tgz -> @webassemblyjs@helper-module-context-1.9.0.tgz
https://registry.npmjs.org/@webassemblyjs/helper-wasm-bytecode/-/helper-wasm-bytecode-1.9.0.tgz -> @webassemblyjs@helper-wasm-bytecode-1.9.0.tgz
https://registry.npmjs.org/@webassemblyjs/helper-wasm-section/-/helper-wasm-section-1.9.0.tgz -> @webassemblyjs@helper-wasm-section-1.9.0.tgz
https://registry.npmjs.org/@webassemblyjs/ieee754/-/ieee754-1.9.0.tgz -> @webassemblyjs@ieee754-1.9.0.tgz
https://registry.npmjs.org/@webassemblyjs/leb128/-/leb128-1.9.0.tgz -> @webassemblyjs@leb128-1.9.0.tgz
https://registry.npmjs.org/@webassemblyjs/utf8/-/utf8-1.9.0.tgz -> @webassemblyjs@utf8-1.9.0.tgz
https://registry.npmjs.org/@webassemblyjs/wasm-edit/-/wasm-edit-1.9.0.tgz -> @webassemblyjs@wasm-edit-1.9.0.tgz
https://registry.npmjs.org/@webassemblyjs/wasm-gen/-/wasm-gen-1.9.0.tgz -> @webassemblyjs@wasm-gen-1.9.0.tgz
https://registry.npmjs.org/@webassemblyjs/wasm-opt/-/wasm-opt-1.9.0.tgz -> @webassemblyjs@wasm-opt-1.9.0.tgz
https://registry.npmjs.org/@webassemblyjs/wasm-parser/-/wasm-parser-1.9.0.tgz -> @webassemblyjs@wasm-parser-1.9.0.tgz
https://registry.npmjs.org/@webassemblyjs/wast-parser/-/wast-parser-1.9.0.tgz -> @webassemblyjs@wast-parser-1.9.0.tgz
https://registry.npmjs.org/@webassemblyjs/wast-printer/-/wast-printer-1.9.0.tgz -> @webassemblyjs@wast-printer-1.9.0.tgz
https://registry.npmjs.org/@xtuc/ieee754/-/ieee754-1.2.0.tgz -> @xtuc@ieee754-1.2.0.tgz
https://registry.npmjs.org/@xtuc/long/-/long-4.2.2.tgz -> @xtuc@long-4.2.2.tgz
https://registry.npmjs.org/acorn/-/acorn-6.4.1.tgz
https://registry.npmjs.org/ajv/-/ajv-6.12.2.tgz
https://registry.npmjs.org/ajv-errors/-/ajv-errors-1.0.1.tgz
https://registry.npmjs.org/ajv-keywords/-/ajv-keywords-3.5.0.tgz
https://registry.npmjs.org/ansi-regex/-/ansi-regex-4.1.0.tgz
https://registry.npmjs.org/ansi-styles/-/ansi-styles-3.2.1.tgz
https://registry.npmjs.org/anymatch/-/anymatch-3.1.1.tgz
https://registry.npmjs.org/anymatch/-/anymatch-2.0.0.tgz
https://registry.npmjs.org/aproba/-/aproba-1.2.0.tgz
https://registry.npmjs.org/arr-diff/-/arr-diff-4.0.0.tgz
https://registry.npmjs.org/arr-flatten/-/arr-flatten-1.1.0.tgz
https://registry.npmjs.org/arr-union/-/arr-union-3.1.0.tgz
https://registry.npmjs.org/array-unique/-/array-unique-0.3.2.tgz
https://registry.npmjs.org/asn1.js/-/asn1.js-4.10.1.tgz
https://registry.npmjs.org/bn.js/-/bn.js-4.11.9.tgz
https://registry.npmjs.org/bn.js/-/bn.js-5.1.2.tgz
https://registry.npmjs.org/assert/-/assert-1.5.0.tgz
https://registry.npmjs.org/inherits/-/inherits-2.0.1.tgz
https://registry.npmjs.org/inherits/-/inherits-2.0.4.tgz
https://registry.npmjs.org/inherits/-/inherits-2.0.3.tgz
https://registry.npmjs.org/util/-/util-0.10.3.tgz
https://registry.npmjs.org/util/-/util-0.11.1.tgz
https://registry.npmjs.org/assign-symbols/-/assign-symbols-1.0.0.tgz
https://registry.npmjs.org/async-each/-/async-each-1.0.3.tgz
https://registry.npmjs.org/atob/-/atob-2.1.2.tgz
https://registry.npmjs.org/balanced-match/-/balanced-match-1.0.0.tgz
https://registry.npmjs.org/base/-/base-0.11.2.tgz
https://registry.npmjs.org/define-property/-/define-property-1.0.0.tgz
https://registry.npmjs.org/define-property/-/define-property-0.2.5.tgz
https://registry.npmjs.org/define-property/-/define-property-2.0.2.tgz
https://registry.npmjs.org/is-accessor-descriptor/-/is-accessor-descriptor-1.0.0.tgz
https://registry.npmjs.org/is-accessor-descriptor/-/is-accessor-descriptor-0.1.6.tgz
https://registry.npmjs.org/is-data-descriptor/-/is-data-descriptor-1.0.0.tgz
https://registry.npmjs.org/is-data-descriptor/-/is-data-descriptor-0.1.4.tgz
https://registry.npmjs.org/is-descriptor/-/is-descriptor-1.0.2.tgz
https://registry.npmjs.org/is-descriptor/-/is-descriptor-0.1.6.tgz
https://registry.npmjs.org/base64-js/-/base64-js-1.3.1.tgz
https://registry.npmjs.org/big.js/-/big.js-5.2.2.tgz
https://registry.npmjs.org/binary-extensions/-/binary-extensions-2.0.0.tgz
https://registry.npmjs.org/binary-extensions/-/binary-extensions-1.13.1.tgz
https://registry.npmjs.org/bluebird/-/bluebird-3.7.2.tgz
https://registry.npmjs.org/brace-expansion/-/brace-expansion-1.1.11.tgz
https://registry.npmjs.org/braces/-/braces-2.3.2.tgz
https://registry.npmjs.org/braces/-/braces-3.0.2.tgz
https://registry.npmjs.org/extend-shallow/-/extend-shallow-2.0.1.tgz
https://registry.npmjs.org/extend-shallow/-/extend-shallow-3.0.2.tgz
https://registry.npmjs.org/brorand/-/brorand-1.1.0.tgz
https://registry.npmjs.org/browserify-aes/-/browserify-aes-1.2.0.tgz
https://registry.npmjs.org/browserify-cipher/-/browserify-cipher-1.0.1.tgz
https://registry.npmjs.org/browserify-des/-/browserify-des-1.0.2.tgz
https://registry.npmjs.org/browserify-rsa/-/browserify-rsa-4.0.1.tgz
https://registry.npmjs.org/browserify-sign/-/browserify-sign-4.2.0.tgz
https://registry.npmjs.org/readable-stream/-/readable-stream-3.6.0.tgz
https://registry.npmjs.org/readable-stream/-/readable-stream-2.3.7.tgz
https://registry.npmjs.org/safe-buffer/-/safe-buffer-5.2.1.tgz
https://registry.npmjs.org/safe-buffer/-/safe-buffer-5.1.2.tgz
https://registry.npmjs.org/browserify-zlib/-/browserify-zlib-0.2.0.tgz
https://registry.npmjs.org/buffer/-/buffer-4.9.2.tgz
https://registry.npmjs.org/buffer-from/-/buffer-from-1.1.1.tgz
https://registry.npmjs.org/buffer-xor/-/buffer-xor-1.0.3.tgz
https://registry.npmjs.org/builtin-status-codes/-/builtin-status-codes-3.0.0.tgz
https://registry.npmjs.org/cacache/-/cacache-12.0.4.tgz
https://registry.npmjs.org/cache-base/-/cache-base-1.0.1.tgz
https://registry.npmjs.org/camelcase/-/camelcase-5.3.1.tgz
https://registry.npmjs.org/chalk/-/chalk-2.4.2.tgz
https://registry.npmjs.org/supports-color/-/supports-color-5.5.0.tgz
https://registry.npmjs.org/supports-color/-/supports-color-6.1.0.tgz
https://registry.npmjs.org/chokidar/-/chokidar-3.4.0.tgz
https://registry.npmjs.org/chokidar/-/chokidar-2.1.8.tgz
https://registry.npmjs.org/fill-range/-/fill-range-7.0.1.tgz
https://registry.npmjs.org/fill-range/-/fill-range-4.0.0.tgz
https://registry.npmjs.org/is-number/-/is-number-7.0.0.tgz
https://registry.npmjs.org/is-number/-/is-number-3.0.0.tgz
https://registry.npmjs.org/to-regex-range/-/to-regex-range-5.0.1.tgz
https://registry.npmjs.org/to-regex-range/-/to-regex-range-2.1.1.tgz
https://registry.npmjs.org/chownr/-/chownr-1.1.4.tgz
https://registry.npmjs.org/chrome-trace-event/-/chrome-trace-event-1.0.2.tgz
https://registry.npmjs.org/cipher-base/-/cipher-base-1.0.4.tgz
https://registry.npmjs.org/class-utils/-/class-utils-0.3.6.tgz
https://registry.npmjs.org/cliui/-/cliui-5.0.0.tgz
https://registry.npmjs.org/collection-visit/-/collection-visit-1.0.0.tgz
https://registry.npmjs.org/color-convert/-/color-convert-1.9.3.tgz
https://registry.npmjs.org/color-name/-/color-name-1.1.3.tgz
https://registry.npmjs.org/commander/-/commander-2.20.3.tgz
https://registry.npmjs.org/commondir/-/commondir-1.0.1.tgz
https://registry.npmjs.org/component-emitter/-/component-emitter-1.3.0.tgz
https://registry.npmjs.org/concat-map/-/concat-map-0.0.1.tgz
https://registry.npmjs.org/concat-stream/-/concat-stream-1.6.2.tgz
https://registry.npmjs.org/console-browserify/-/console-browserify-1.2.0.tgz
https://registry.npmjs.org/constants-browserify/-/constants-browserify-1.0.0.tgz
https://registry.npmjs.org/copy-concurrently/-/copy-concurrently-1.0.5.tgz
https://registry.npmjs.org/copy-descriptor/-/copy-descriptor-0.1.1.tgz
https://registry.npmjs.org/core-util-is/-/core-util-is-1.0.2.tgz
https://registry.npmjs.org/create-ecdh/-/create-ecdh-4.0.3.tgz
https://registry.npmjs.org/create-hash/-/create-hash-1.2.0.tgz
https://registry.npmjs.org/create-hmac/-/create-hmac-1.1.7.tgz
https://registry.npmjs.org/cross-spawn/-/cross-spawn-6.0.5.tgz
https://registry.npmjs.org/crypto-browserify/-/crypto-browserify-3.12.0.tgz
https://registry.npmjs.org/cyclist/-/cyclist-1.0.1.tgz
https://registry.npmjs.org/debug/-/debug-2.6.9.tgz
https://registry.npmjs.org/decamelize/-/decamelize-1.2.0.tgz
https://registry.npmjs.org/decode-uri-component/-/decode-uri-component-0.2.0.tgz
https://registry.npmjs.org/des.js/-/des.js-1.0.1.tgz
https://registry.npmjs.org/detect-file/-/detect-file-1.0.0.tgz
https://registry.npmjs.org/diffie-hellman/-/diffie-hellman-5.0.3.tgz
https://registry.npmjs.org/domain-browser/-/domain-browser-1.2.0.tgz
https://registry.npmjs.org/duplexify/-/duplexify-3.7.1.tgz
https://registry.npmjs.org/elliptic/-/elliptic-6.5.3.tgz
https://registry.npmjs.org/emoji-regex/-/emoji-regex-7.0.3.tgz
https://registry.npmjs.org/emojis-list/-/emojis-list-3.0.0.tgz
https://registry.npmjs.org/end-of-stream/-/end-of-stream-1.4.4.tgz
https://registry.npmjs.org/enhanced-resolve/-/enhanced-resolve-4.2.0.tgz
https://registry.npmjs.org/memory-fs/-/memory-fs-0.5.0.tgz
https://registry.npmjs.org/memory-fs/-/memory-fs-0.4.1.tgz
https://registry.npmjs.org/errno/-/errno-0.1.7.tgz
https://registry.npmjs.org/escape-string-regexp/-/escape-string-regexp-1.0.5.tgz
https://registry.npmjs.org/eslint-scope/-/eslint-scope-4.0.3.tgz
https://registry.npmjs.org/esrecurse/-/esrecurse-4.2.1.tgz
https://registry.npmjs.org/estraverse/-/estraverse-4.3.0.tgz
https://registry.npmjs.org/events/-/events-3.1.0.tgz
https://registry.npmjs.org/evp_bytestokey/-/evp_bytestokey-1.0.3.tgz
https://registry.npmjs.org/expand-brackets/-/expand-brackets-2.1.4.tgz
https://registry.npmjs.org/expand-tilde/-/expand-tilde-2.0.2.tgz
https://registry.npmjs.org/is-extendable/-/is-extendable-1.0.1.tgz
https://registry.npmjs.org/is-extendable/-/is-extendable-0.1.1.tgz
https://registry.npmjs.org/extglob/-/extglob-2.0.4.tgz
https://registry.npmjs.org/fast-deep-equal/-/fast-deep-equal-3.1.3.tgz
https://registry.npmjs.org/fast-json-stable-stringify/-/fast-json-stable-stringify-2.1.0.tgz
https://registry.npmjs.org/figgy-pudding/-/figgy-pudding-3.5.2.tgz
https://registry.npmjs.org/find-cache-dir/-/find-cache-dir-2.1.0.tgz
https://registry.npmjs.org/find-up/-/find-up-3.0.0.tgz
https://registry.npmjs.org/findup-sync/-/findup-sync-3.0.0.tgz
https://registry.npmjs.org/flush-write-stream/-/flush-write-stream-1.1.1.tgz
https://registry.npmjs.org/for-in/-/for-in-1.0.2.tgz
https://registry.npmjs.org/fragment-cache/-/fragment-cache-0.2.1.tgz
https://registry.npmjs.org/from2/-/from2-2.3.0.tgz
https://registry.npmjs.org/fs-write-stream-atomic/-/fs-write-stream-atomic-1.0.10.tgz
https://registry.npmjs.org/fs.realpath/-/fs.realpath-1.0.0.tgz
https://registry.npmjs.org/fsevents/-/fsevents-2.1.3.tgz
https://registry.npmjs.org/fsevents/-/fsevents-1.2.13.tgz
https://registry.npmjs.org/get-caller-file/-/get-caller-file-2.0.5.tgz
https://registry.npmjs.org/get-value/-/get-value-2.0.6.tgz
https://registry.npmjs.org/glob/-/glob-7.1.6.tgz
https://registry.npmjs.org/glob-parent/-/glob-parent-5.1.1.tgz
https://registry.npmjs.org/glob-parent/-/glob-parent-3.1.0.tgz
https://registry.npmjs.org/global-modules/-/global-modules-2.0.0.tgz
https://registry.npmjs.org/global-modules/-/global-modules-1.0.0.tgz
https://registry.npmjs.org/global-prefix/-/global-prefix-3.0.0.tgz
https://registry.npmjs.org/global-prefix/-/global-prefix-1.0.2.tgz
https://registry.npmjs.org/graceful-fs/-/graceful-fs-4.2.4.tgz
https://registry.npmjs.org/has-flag/-/has-flag-3.0.0.tgz
https://registry.npmjs.org/has-value/-/has-value-1.0.0.tgz
https://registry.npmjs.org/has-value/-/has-value-0.3.1.tgz
https://registry.npmjs.org/has-values/-/has-values-1.0.0.tgz
https://registry.npmjs.org/has-values/-/has-values-0.1.4.tgz
https://registry.npmjs.org/kind-of/-/kind-of-4.0.0.tgz
https://registry.npmjs.org/kind-of/-/kind-of-3.2.2.tgz
https://registry.npmjs.org/kind-of/-/kind-of-5.1.0.tgz
https://registry.npmjs.org/kind-of/-/kind-of-6.0.3.tgz
https://registry.npmjs.org/hash-base/-/hash-base-3.1.0.tgz
https://registry.npmjs.org/hash.js/-/hash.js-1.1.7.tgz
https://registry.npmjs.org/hmac-drbg/-/hmac-drbg-1.0.1.tgz
https://registry.npmjs.org/homedir-polyfill/-/homedir-polyfill-1.0.3.tgz
https://registry.npmjs.org/https-browserify/-/https-browserify-1.0.0.tgz
https://registry.npmjs.org/ieee754/-/ieee754-1.1.13.tgz
https://registry.npmjs.org/iferr/-/iferr-0.1.5.tgz
https://registry.npmjs.org/import-local/-/import-local-2.0.0.tgz
https://registry.npmjs.org/imurmurhash/-/imurmurhash-0.1.4.tgz
https://registry.npmjs.org/infer-owner/-/infer-owner-1.0.4.tgz
https://registry.npmjs.org/inflight/-/inflight-1.0.6.tgz
https://registry.npmjs.org/ini/-/ini-1.3.5.tgz
https://registry.npmjs.org/interpret/-/interpret-1.4.0.tgz
https://registry.npmjs.org/is-binary-path/-/is-binary-path-2.1.0.tgz
https://registry.npmjs.org/is-binary-path/-/is-binary-path-1.0.1.tgz
https://registry.npmjs.org/is-buffer/-/is-buffer-1.1.6.tgz
https://registry.npmjs.org/is-extglob/-/is-extglob-2.1.1.tgz
https://registry.npmjs.org/is-fullwidth-code-point/-/is-fullwidth-code-point-2.0.0.tgz
https://registry.npmjs.org/is-glob/-/is-glob-4.0.1.tgz
https://registry.npmjs.org/is-glob/-/is-glob-3.1.0.tgz
https://registry.npmjs.org/is-plain-object/-/is-plain-object-2.0.4.tgz
https://registry.npmjs.org/is-windows/-/is-windows-1.0.2.tgz
https://registry.npmjs.org/is-wsl/-/is-wsl-1.1.0.tgz
https://registry.npmjs.org/isarray/-/isarray-1.0.0.tgz
https://registry.npmjs.org/isexe/-/isexe-2.0.0.tgz
https://registry.npmjs.org/isobject/-/isobject-3.0.1.tgz
https://registry.npmjs.org/isobject/-/isobject-2.1.0.tgz
https://registry.npmjs.org/json-parse-better-errors/-/json-parse-better-errors-1.0.2.tgz
https://registry.npmjs.org/json-schema-traverse/-/json-schema-traverse-0.4.1.tgz
https://registry.npmjs.org/json5/-/json5-1.0.1.tgz
https://registry.npmjs.org/loader-runner/-/loader-runner-2.4.0.tgz
https://registry.npmjs.org/loader-utils/-/loader-utils-1.4.0.tgz
https://registry.npmjs.org/locate-path/-/locate-path-3.0.0.tgz
https://registry.npmjs.org/lru-cache/-/lru-cache-5.1.1.tgz
https://registry.npmjs.org/make-dir/-/make-dir-2.1.0.tgz
https://registry.npmjs.org/map-cache/-/map-cache-0.2.2.tgz
https://registry.npmjs.org/map-visit/-/map-visit-1.0.0.tgz
https://registry.npmjs.org/md5.js/-/md5.js-1.3.5.tgz
https://registry.npmjs.org/micromatch/-/micromatch-3.1.10.tgz
https://registry.npmjs.org/miller-rabin/-/miller-rabin-4.0.1.tgz
https://registry.npmjs.org/minimalistic-assert/-/minimalistic-assert-1.0.1.tgz
https://registry.npmjs.org/minimalistic-crypto-utils/-/minimalistic-crypto-utils-1.0.1.tgz
https://registry.npmjs.org/minimatch/-/minimatch-3.0.4.tgz
https://registry.npmjs.org/minimist/-/minimist-1.2.5.tgz
https://registry.npmjs.org/mississippi/-/mississippi-3.0.0.tgz
https://registry.npmjs.org/mixin-deep/-/mixin-deep-1.3.2.tgz
https://registry.npmjs.org/mkdirp/-/mkdirp-0.5.5.tgz
https://registry.npmjs.org/move-concurrently/-/move-concurrently-1.0.1.tgz
https://registry.npmjs.org/ms/-/ms-2.0.0.tgz
https://registry.npmjs.org/nanomatch/-/nanomatch-1.2.13.tgz
https://registry.npmjs.org/neo-async/-/neo-async-2.6.1.tgz
https://registry.npmjs.org/nice-try/-/nice-try-1.0.5.tgz
https://registry.npmjs.org/node-libs-browser/-/node-libs-browser-2.2.1.tgz
https://registry.npmjs.org/punycode/-/punycode-1.4.1.tgz
https://registry.npmjs.org/punycode/-/punycode-2.1.1.tgz
https://registry.npmjs.org/punycode/-/punycode-1.3.2.tgz
https://registry.npmjs.org/normalize-path/-/normalize-path-3.0.0.tgz
https://registry.npmjs.org/normalize-path/-/normalize-path-2.1.1.tgz
https://registry.npmjs.org/object-assign/-/object-assign-4.1.1.tgz
https://registry.npmjs.org/object-copy/-/object-copy-0.1.0.tgz
https://registry.npmjs.org/object-visit/-/object-visit-1.0.1.tgz
https://registry.npmjs.org/object.pick/-/object.pick-1.3.0.tgz
https://registry.npmjs.org/once/-/once-1.4.0.tgz
https://registry.npmjs.org/os-browserify/-/os-browserify-0.3.0.tgz
https://registry.npmjs.org/p-limit/-/p-limit-2.3.0.tgz
https://registry.npmjs.org/p-locate/-/p-locate-3.0.0.tgz
https://registry.npmjs.org/p-try/-/p-try-2.2.0.tgz
https://registry.npmjs.org/pako/-/pako-1.0.11.tgz
https://registry.npmjs.org/parallel-transform/-/parallel-transform-1.2.0.tgz
https://registry.npmjs.org/parse-asn1/-/parse-asn1-5.1.5.tgz
https://registry.npmjs.org/parse-passwd/-/parse-passwd-1.0.0.tgz
https://registry.npmjs.org/pascalcase/-/pascalcase-0.1.1.tgz
https://registry.npmjs.org/path-browserify/-/path-browserify-0.0.1.tgz
https://registry.npmjs.org/path-dirname/-/path-dirname-1.0.2.tgz
https://registry.npmjs.org/path-exists/-/path-exists-3.0.0.tgz
https://registry.npmjs.org/path-is-absolute/-/path-is-absolute-1.0.1.tgz
https://registry.npmjs.org/path-key/-/path-key-2.0.1.tgz
https://registry.npmjs.org/pbkdf2/-/pbkdf2-3.1.1.tgz
https://registry.npmjs.org/picomatch/-/picomatch-2.2.2.tgz
https://registry.npmjs.org/pify/-/pify-4.0.1.tgz
https://registry.npmjs.org/pkg-dir/-/pkg-dir-3.0.0.tgz
https://registry.npmjs.org/posix-character-classes/-/posix-character-classes-0.1.1.tgz
https://registry.npmjs.org/process/-/process-0.11.10.tgz
https://registry.npmjs.org/process-nextick-args/-/process-nextick-args-2.0.1.tgz
https://registry.npmjs.org/promise-inflight/-/promise-inflight-1.0.1.tgz
https://registry.npmjs.org/prr/-/prr-1.0.1.tgz
https://registry.npmjs.org/public-encrypt/-/public-encrypt-4.0.3.tgz
https://registry.npmjs.org/pump/-/pump-3.0.0.tgz
https://registry.npmjs.org/pump/-/pump-2.0.1.tgz
https://registry.npmjs.org/pumpify/-/pumpify-1.5.1.tgz
https://registry.npmjs.org/querystring/-/querystring-0.2.0.tgz
https://registry.npmjs.org/querystring-es3/-/querystring-es3-0.2.1.tgz
https://registry.npmjs.org/randombytes/-/randombytes-2.1.0.tgz
https://registry.npmjs.org/randomfill/-/randomfill-1.0.4.tgz
https://registry.npmjs.org/readdirp/-/readdirp-3.4.0.tgz
https://registry.npmjs.org/readdirp/-/readdirp-2.2.1.tgz
https://registry.npmjs.org/regex-not/-/regex-not-1.0.2.tgz
https://registry.npmjs.org/remove-trailing-separator/-/remove-trailing-separator-1.1.0.tgz
https://registry.npmjs.org/repeat-element/-/repeat-element-1.1.3.tgz
https://registry.npmjs.org/repeat-string/-/repeat-string-1.6.1.tgz
https://registry.npmjs.org/require-directory/-/require-directory-2.1.1.tgz
https://registry.npmjs.org/require-main-filename/-/require-main-filename-2.0.0.tgz
https://registry.npmjs.org/resolve-cwd/-/resolve-cwd-2.0.0.tgz
https://registry.npmjs.org/resolve-dir/-/resolve-dir-1.0.1.tgz
https://registry.npmjs.org/resolve-from/-/resolve-from-3.0.0.tgz
https://registry.npmjs.org/resolve-url/-/resolve-url-0.2.1.tgz
https://registry.npmjs.org/ret/-/ret-0.1.15.tgz
https://registry.npmjs.org/rimraf/-/rimraf-2.7.1.tgz
https://registry.npmjs.org/ripemd160/-/ripemd160-2.0.2.tgz
https://registry.npmjs.org/run-queue/-/run-queue-1.0.3.tgz
https://registry.npmjs.org/safe-regex/-/safe-regex-1.1.0.tgz
https://registry.npmjs.org/schema-utils/-/schema-utils-1.0.0.tgz
https://registry.npmjs.org/semver/-/semver-5.7.1.tgz
https://registry.npmjs.org/serialize-javascript/-/serialize-javascript-3.1.0.tgz
https://registry.npmjs.org/set-blocking/-/set-blocking-2.0.0.tgz
https://registry.npmjs.org/set-value/-/set-value-2.0.1.tgz
https://registry.npmjs.org/setimmediate/-/setimmediate-1.0.5.tgz
https://registry.npmjs.org/sha.js/-/sha.js-2.4.11.tgz
https://registry.npmjs.org/shebang-command/-/shebang-command-1.2.0.tgz
https://registry.npmjs.org/shebang-regex/-/shebang-regex-1.0.0.tgz
https://registry.npmjs.org/snapdragon/-/snapdragon-0.8.2.tgz
https://registry.npmjs.org/snapdragon-node/-/snapdragon-node-2.1.1.tgz
https://registry.npmjs.org/snapdragon-util/-/snapdragon-util-3.0.1.tgz
https://registry.npmjs.org/source-list-map/-/source-list-map-2.0.1.tgz
https://registry.npmjs.org/source-map/-/source-map-0.5.7.tgz
https://registry.npmjs.org/source-map/-/source-map-0.6.1.tgz
https://registry.npmjs.org/source-map-resolve/-/source-map-resolve-0.5.3.tgz
https://registry.npmjs.org/source-map-support/-/source-map-support-0.5.19.tgz
https://registry.npmjs.org/source-map-url/-/source-map-url-0.4.0.tgz
https://registry.npmjs.org/split-string/-/split-string-3.1.0.tgz
https://registry.npmjs.org/ssri/-/ssri-6.0.1.tgz
https://registry.npmjs.org/static-extend/-/static-extend-0.1.2.tgz
https://registry.npmjs.org/stream-browserify/-/stream-browserify-2.0.2.tgz
https://registry.npmjs.org/stream-each/-/stream-each-1.2.3.tgz
https://registry.npmjs.org/stream-http/-/stream-http-2.8.3.tgz
https://registry.npmjs.org/stream-shift/-/stream-shift-1.0.1.tgz
https://registry.npmjs.org/string-width/-/string-width-3.1.0.tgz
https://registry.npmjs.org/string_decoder/-/string_decoder-1.1.1.tgz
https://registry.npmjs.org/strip-ansi/-/strip-ansi-5.2.0.tgz
https://registry.npmjs.org/tapable/-/tapable-1.1.3.tgz
https://registry.npmjs.org/terser/-/terser-4.8.0.tgz
https://registry.npmjs.org/terser-webpack-plugin/-/terser-webpack-plugin-1.4.4.tgz
https://registry.npmjs.org/through2/-/through2-2.0.5.tgz
https://registry.npmjs.org/timers-browserify/-/timers-browserify-2.0.11.tgz
https://registry.npmjs.org/to-arraybuffer/-/to-arraybuffer-1.0.1.tgz
https://registry.npmjs.org/to-object-path/-/to-object-path-0.3.0.tgz
https://registry.npmjs.org/to-regex/-/to-regex-3.0.2.tgz
https://registry.npmjs.org/tslib/-/tslib-1.13.0.tgz
https://registry.npmjs.org/tty-browserify/-/tty-browserify-0.0.0.tgz
https://registry.npmjs.org/typedarray/-/typedarray-0.0.6.tgz
https://registry.npmjs.org/union-value/-/union-value-1.0.1.tgz
https://registry.npmjs.org/unique-filename/-/unique-filename-1.1.1.tgz
https://registry.npmjs.org/unique-slug/-/unique-slug-2.0.2.tgz
https://registry.npmjs.org/unset-value/-/unset-value-1.0.0.tgz
https://registry.npmjs.org/upath/-/upath-1.2.0.tgz
https://registry.npmjs.org/uri-js/-/uri-js-4.2.2.tgz
https://registry.npmjs.org/urix/-/urix-0.1.0.tgz
https://registry.npmjs.org/url/-/url-0.11.0.tgz
https://registry.npmjs.org/use/-/use-3.1.1.tgz
https://registry.npmjs.org/util-deprecate/-/util-deprecate-1.0.2.tgz
https://registry.npmjs.org/v8-compile-cache/-/v8-compile-cache-2.1.1.tgz
https://registry.npmjs.org/vm-browserify/-/vm-browserify-1.1.2.tgz
https://registry.npmjs.org/watchpack/-/watchpack-1.7.2.tgz
https://registry.npmjs.org/watchpack-chokidar2/-/watchpack-chokidar2-2.0.0.tgz
https://registry.npmjs.org/webpack-sources/-/webpack-sources-1.4.3.tgz
https://registry.npmjs.org/which/-/which-1.3.1.tgz
https://registry.npmjs.org/which-module/-/which-module-2.0.0.tgz
https://registry.npmjs.org/worker-farm/-/worker-farm-1.7.0.tgz
https://registry.npmjs.org/wrap-ansi/-/wrap-ansi-5.1.0.tgz
https://registry.npmjs.org/wrappy/-/wrappy-1.0.2.tgz
https://registry.npmjs.org/xtend/-/xtend-4.0.2.tgz
https://registry.npmjs.org/y18n/-/y18n-4.0.0.tgz
https://registry.npmjs.org/yallist/-/yallist-3.1.1.tgz
https://registry.npmjs.org/yargs/-/yargs-13.3.2.tgz
https://registry.npmjs.org/yargs-parser/-/yargs-parser-13.1.2.tgz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="net-libs/nodejs"
BDEPEND=""

src_compile() {
	enpm --cache ./cache install ${PN}@${PV} webpack-cli@${WEBPACK_CLI_VERSION}
}

src_install() {
	xel-nodejs_src_install

	dosym ../lib/nodejs/${PN}/node_modules/.bin/${PN} /usr/bin/webpack
}
