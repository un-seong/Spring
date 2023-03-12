package com.itbank.component;

import java.math.BigInteger;
import java.security.MessageDigest;

import org.springframework.stereotype.Component;

@Component
public class HashComponent {
	
	public String getHash(String input) {
		String hash = null;
		
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("SHA-512");
			md.update(input.getBytes());
			hash = String.format("%0128x", new BigInteger(1, md.digest()));
		} catch (Exception e) {}
		
		return hash;
		
	}
}
