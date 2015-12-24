package com.qile.entity;
// Generated 2015-12-24 20:56:24 by Hibernate Tools 4.3.1.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Association generated by hbm2java
 */
@Entity
@Table(name = "association", catalog = "qile")
public class Association implements java.io.Serializable {

	private Integer id;
	private String username;
	private String password;
	private String contact;
	private String position;
	private String phone;
	private String email;
	private String wechat;
	private String city;
	private String school;
	private String name;
	private String type;
	private String people;
	private String description;
	private String purchaseConcern;
	private String purchaseAddition;
	private Integer purchaseFee;
	private String securityCode;

	public Association() {
	}

	public Association(String username, String password, String contact, String position, String phone, String email,
			String wechat, String city, String school, String name, String type, String people, String description,
			String purchaseConcern, String purchaseAddition, Integer purchaseFee, String securityCode) {
		this.username = username;
		this.password = password;
		this.contact = contact;
		this.position = position;
		this.phone = phone;
		this.email = email;
		this.wechat = wechat;
		this.city = city;
		this.school = school;
		this.name = name;
		this.type = type;
		this.people = people;
		this.description = description;
		this.purchaseConcern = purchaseConcern;
		this.purchaseAddition = purchaseAddition;
		this.purchaseFee = purchaseFee;
		this.securityCode = securityCode;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "username", length = 45)
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "password", length = 45)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "contact", length = 45)
	public String getContact() {
		return this.contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	@Column(name = "position", length = 45)
	public String getPosition() {
		return this.position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	@Column(name = "phone", length = 45)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "email", length = 45)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "wechat", length = 45)
	public String getWechat() {
		return this.wechat;
	}

	public void setWechat(String wechat) {
		this.wechat = wechat;
	}

	@Column(name = "city", length = 45)
	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Column(name = "school", length = 45)
	public String getSchool() {
		return this.school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	@Column(name = "name", length = 45)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "type", length = 45)
	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name = "people", length = 45)
	public String getPeople() {
		return this.people;
	}

	public void setPeople(String people) {
		this.people = people;
	}

	@Column(name = "description", length = 300)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "purchase_concern", length = 45)
	public String getPurchaseConcern() {
		return this.purchaseConcern;
	}

	public void setPurchaseConcern(String purchaseConcern) {
		this.purchaseConcern = purchaseConcern;
	}

	@Column(name = "purchase_addition", length = 100)
	public String getPurchaseAddition() {
		return this.purchaseAddition;
	}

	public void setPurchaseAddition(String purchaseAddition) {
		this.purchaseAddition = purchaseAddition;
	}

	@Column(name = "purchase_fee")
	public Integer getPurchaseFee() {
		return this.purchaseFee;
	}

	public void setPurchaseFee(Integer purchaseFee) {
		this.purchaseFee = purchaseFee;
	}

	@Column(name = "security_code", length = 45)
	public String getSecurityCode() {
		return this.securityCode;
	}

	public void setSecurityCode(String securityCode) {
		this.securityCode = securityCode;
	}

}
