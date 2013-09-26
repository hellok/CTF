<?php

$method = 'AES-256-ECB';
$SIZE = 256;

$hash = array();

$key1 = "";
for ($i = 0; $i < 32; $i++) $key1 .= chr(0);
$key2 = $key1;

$plaintext = base64_decode("RWFjaCBrZXkgemVybyB1bnRpbCBsYXN0IDI0IGJpdHM=");
$ciphertext = "01YZbSrta2N+1pOeQppmPETzoT/Yqb816yGlyceuEOE=";

for ($i = 0; $i < $SIZE; $i++) {
	$key1[29] = chr($i);
	echo "Round $i\n";
	for ($j = 0; $j < $SIZE; $j++) {
		$key1[30] = chr($j);
		for ($k = 0; $k < $SIZE; $k++) {
			$key1[31] = chr($k);
			$text = openssl_encrypt($plaintext, $method, $key1, OPENSSL_ZERO_PADDING);
			$text = substr($text, 0, 10);
			$hash[$text] = ($i<<16) + ($j<<8) +($k);
		}
	}
}

echo "%50\n".sizeof($hash)."\n";

for ($i = 0; $i < $SIZE; $i++) {
	$key2[29] = chr($i);
	echo "Round $i\n";
	for ($j = 0; $j < $SIZE; $j++) {
		$key2[30] = chr($j);
		for ($k = 0; $k < $SIZE; $k++) {
			$key2[31] = chr($k);
			$text = openssl_decrypt($ciphertext, $method, $key2, OPENSSL_ZERO_PADDING);
			$text = base64_encode($text);
			$text = substr($text, 0, 10);
			if (array_key_exists($text, $hash)) {
				$t = ($i<<16) + ($j<<8) +($k);
				echo $hash[$text]."\n$t\n DONE\n";
			}
		}
	}
}
/*

DONE
10151943
16727877
message 1:  QUVTLTI1NiBFQ0IgbW9kZSB0d2ljZSwgdHdvIGtleXM=
encrypted:  THbpB4bE82Rq35khemTQ10ntxZ8sf7s2WK8ErwcdDEc=
message 2:  RWFjaCBrZXkgemVybyB1bnRpbCBsYXN0IDI0IGJpdHM=
encrypted:  01YZbSrta2N+1pOeQppmPETzoT/Yqb816yGlyceuEOE=
ciphertext: s5hd0ThTkv1U44r9aRyUhaX5qJe561MZ16071nlvM9U=
