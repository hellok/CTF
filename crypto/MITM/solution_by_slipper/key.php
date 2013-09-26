<?php

$method = 'AES-256-ECB';
$SIZE = 256;

$hash = array();

$key1 = "";
for ($i = 0; $i < 32; $i++) $key1 .= chr(0);
$key2 = $key1;

$key1[29] = chr(154);
$key1[30] = chr(232);
$key1[31] = chr(7);

$key2[29] = chr(255);
$key2[30] = chr(63);
$key2[31] = chr(69);

$plaintext = "RWFjaCBrZXkgemVybyB1bnRpbCBsYXN0IDI0IGJpdHM=";
$plaintext = base64_decode($plaintext);
$ciphertext ="s5hd0ThTkv1U44r9aRyUhaX5qJe561MZ16071nlvM9U=";
$b = openssl_decrypt($ciphertext, $method, $key2, OPENSSL_ZERO_PADDING);
$a = openssl_decrypt(base64_encode($b), $method, $key1, OPENSSL_ZERO_PADDING);
var_dump($a);

/*

DONE
10151943
16727877
message 1:  QUVTLTI1NiBFQ0IgbW9kZSB0d2ljZSwgdHdvIGtleXM=
encrypted:  THbpB4bE82Rq35khemTQ10ntxZ8sf7s2WK8ErwcdDEc=
message 2:  RWFjaCBrZXkgemVybyB1bnRpbCBsYXN0IDI0IGJpdHM=
encrypted:  01YZbSrta2N+1pOeQppmPETzoT/Yqb816yGlyceuEOE=
ciphertext: s5hd0ThTkv1U44r9aRyUhaX5qJe561MZ16071nlvM9U=
