package com.spring.bm.common.encrypt;

public interface MyEncrypt {
	String encrypt(String msg) throws Exception;
	String decrypt(String msg) throws Exception;
}
