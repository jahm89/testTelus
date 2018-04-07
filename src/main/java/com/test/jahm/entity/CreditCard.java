package com.test.jahm.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author jahm
 */
@Entity
@Table(name = "credit_card")
@XmlRootElement
public class CreditCard implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "number")
    private String number;
    @Basic(optional = false)
    @NotNull
    @Column(name = "month_expiration")
    private int monthExpiration;
    @Basic(optional = false)
    @NotNull
    @Column(name = "year_expiration")
    private int yearExpiration;
    @Basic(optional = false)
    @NotNull
    @Column(name = "number_pin")
    private int numberPin;
    @JoinColumn(name = "id_donor", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Donor idDonor;

    public CreditCard() {
    }

    public CreditCard(Integer id) {
        this.id = id;
    }

    public CreditCard(Integer id, String number, int monthExpiration, int yearExpiration, int numberPin) {
        this.id = id;
        this.number = number;
        this.monthExpiration = monthExpiration;
        this.yearExpiration = yearExpiration;
        this.numberPin = numberPin;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public int getMonthExpiration() {
        return monthExpiration;
    }

    public void setMonthExpiration(int monthExpiration) {
        this.monthExpiration = monthExpiration;
    }

    public int getYearExpiration() {
        return yearExpiration;
    }

    public void setYearExpiration(int yearExpiration) {
        this.yearExpiration = yearExpiration;
    }

    public int getNumberPin() {
        return numberPin;
    }

    public void setNumberPin(int numberPin) {
        this.numberPin = numberPin;
    }

    public Donor getIdDonor() {
        return idDonor;
    }

    public void setIdDonor(Donor idDonor) {
        this.idDonor = idDonor;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CreditCard)) {
            return false;
        }
        CreditCard other = (CreditCard) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.entities.CreditCard[ id=" + id + " ]";
    }
    
}

