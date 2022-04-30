package beans;

import java.util.ArrayList;

public class MetodoPagamentoBean {
	private Integer idMetodoPagamento;
	private String tipo;
	private String nomeIntestatario;
	private String numeroCarta;
	private int meseScadenza;
	private int annoScadenza;
	private String iban;
	private String causale;
	private String circuito;
	private Integer CVV;
	private ArrayList<String> utenti = new ArrayList<>();



	public int getIdMetodoPagamento() {
		return idMetodoPagamento;
	}

	public void setIdMetodoPagamento(int idMetodoPagamento) {
		this.idMetodoPagamento = idMetodoPagamento;
	}

	public String getCircuito() {
		return circuito;
	}

	public void setCircuito(String circuito) {
		this.circuito = circuito;
	}

	public Integer getCVV() {
		return CVV;
	}

	public void setCVV(Integer cVV) {
		CVV = cVV;
	}

	public MetodoPagamentoBean() {

	}

	public int getidMetodoPagamento() {
		return idMetodoPagamento;
	}

	public void setidMetodoPagamento(int id) {
		this.idMetodoPagamento = id;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getNomeIntestatario() {
		return nomeIntestatario;
	}

	public void setNomeIntestatario(String nome) {
		this.nomeIntestatario = nome;
	}

	public String getNumeroCarta() {
		return numeroCarta;
	}

	public void setNumeroCarta(String numero) {
		this.numeroCarta = numero;
	}

	public int getMeseScadenza() {
		return meseScadenza;
	}

	public void setMeseScadenza(int mese) {
		this.meseScadenza = mese;
	}

	public int getAnnoScadenza() {
		return annoScadenza;
	}

	public int setAnnoScadenza(int anno) {
		return this.annoScadenza = anno;
	}

	public String getIban() {
		return iban;
	}

	public String setIban(String iban) {
		return this.iban = iban;
	}

	public String getCausale() {
		return causale;
	}

	public String setCausale(String causale) {
		return this.causale = causale;
	}


	public ArrayList<String> getUtenti() {
		return utenti;
	}

	public void setUtenti(ArrayList<String> utenti) {
		this.utenti = utenti;
	}

	@Override
	public String toString() {
		return "MetodoPagamento [id=" + idMetodoPagamento + ", tipo=" + tipo + ", nomeIntestatario=" + nomeIntestatario + ", numeroCarta="
				+ numeroCarta + ", meseScadenza=" + meseScadenza + ", annoScadenza=" + annoScadenza + ", iban=" + iban + ", causale=" + causale+  "]";
	}

}