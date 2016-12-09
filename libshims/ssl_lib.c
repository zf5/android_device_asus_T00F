#include <assert.h>
#include <stdio.h>
#include <string.h>

#include <openssl/ssl.h>
#include <openssl/bytestring.h>
#include <openssl/dh.h>
#include <openssl/err.h>
#include <openssl/lhash.h>
#include <openssl/mem.h>
#include <openssl/obj.h>
#include <openssl/rand.h>
#include <openssl/x509v3.h>

struct ssl_protocol_method_st {
  /* is_dtls is one if the protocol is DTLS and zero otherwise. */
  char is_dtls;
  int (*ssl_new)(SSL *ssl);
  void (*ssl_free)(SSL *ssl);
  int (*ssl_accept)(SSL *ssl);
  int (*ssl_connect)(SSL *ssl);
  long (*ssl_get_message)(SSL *ssl, int header_state, int body_state,
                          int msg_type, long max,
                          enum ssl_hash_message_t hash_message, int *ok);
  int (*ssl_read_app_data)(SSL *ssl, uint8_t *buf, int len, int peek);
  int (*ssl_read_change_cipher_spec)(SSL *ssl);
  void (*ssl_read_close_notify)(SSL *ssl);
  int (*ssl_write_app_data)(SSL *ssl, const void *buf_, int len);
  int (*ssl_dispatch_alert)(SSL *ssl);
  long (*ssl_ctrl)(SSL *s, int cmd, long larg, void *parg);
  long (*ssl_ctx_ctrl)(SSL_CTX *ctx, int cmd, long larg, void *parg);
  /* supports_cipher returns one if |cipher| is supported by this protocol and
   * zero otherwise. */
  int (*supports_cipher)(const SSL_CIPHER *cipher);
  /* Handshake header length */
  unsigned int hhlen;
  /* Set the handshake header */
  int (*set_handshake_header)(SSL *ssl, int type, unsigned long len);
  /* Write out handshake message */
  int (*do_write)(SSL *ssl);
};

long SSL_ctrl(SSL *s, int cmd, long larg, void *parg) {
  return s->method->ssl_ctrl(s, cmd, larg, parg);
 }

long SSL_CTX_ctrl(SSL_CTX *ctx, int cmd, long larg, void *parg) {
  return ctx->method->ssl_ctx_ctrl(ctx, cmd, larg, parg);
 }
