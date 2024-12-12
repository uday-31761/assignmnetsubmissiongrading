package com.klef.jfsd.oasgs.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "handle_registrations")
public class Registrations {
	
	@Id
	private int id;
	private boolean status;

	@Override
	public String toString() {
		return "Registrations [status=" + status + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}
}
