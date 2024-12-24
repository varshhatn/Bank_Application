package com.Bank.DAO;

import java.util.List;

import com.Bank.DTO.Transaction;

public interface TransactionDAO {

	public boolean insertTransaction(Transaction t);
	public List getTransaction(long user);
	public List getTransaction();
}
