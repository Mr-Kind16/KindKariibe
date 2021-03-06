package model;

import java.util.HashMap;
import java.util.concurrent.ConcurrentHashMap;

import beans.ProdottoBean;

public class Carrello {

	private ConcurrentHashMap<ProdottoBean,Integer> products;
	
	public Carrello() {
		this.products = new ConcurrentHashMap<>();
	}
	
	
	
	
	public synchronized  void addProduct(ProdottoBean product) {
		
		boolean flag = false;
		
			for(ProdottoBean prodotto : products.keySet())
			{
				if(prodotto.getId().equals(product.getId()))
				{
					flag = true;
					products.replace(prodotto, products.get(prodotto) + 1);
				}
			
			}
			
			if(!flag)
			{
				products.put(product, 1);
			}
			
		
	}
	
	public synchronized void deleteProduct(ProdottoBean product) {
		
		for(ProdottoBean prodotto : products.keySet())
		{
			if(prodotto.getId().equals(product.getId()))
			{
				if(products.get(prodotto) == 1)
				{
					products.remove(prodotto);
				}
				else
				{
					products.replace(prodotto, products.get(prodotto) - 1);
				}			
			}
		}
		
	}
		
	public ConcurrentHashMap<ProdottoBean, Integer> getProducts() {
		return  products;
	}

	@Override
	public String toString() {
		return products.toString() ;
	}
	
	public synchronized Double getCostoTotale() {
		
		if(this.products.keySet().isEmpty()) {
			return (double) 0;
		}
			
		Double totale=new Double(0);
		for(ProdottoBean prodotto : this.products.keySet()) {
			totale+= prodotto.getPrezzo()* this.products.get(prodotto);
		}
		return totale;
	}
	
	public Double getTax()
	{
		double totale = 0;
		for(ProdottoBean prodotto : this.products.keySet()) {
			totale+=prodotto.getIVACarrello()*this.products.get(prodotto);
		}
	
		System.out.println(totale);
		return totale;
	}

	public synchronized void eliminaProdotto(ProdottoBean product) {
		for(ProdottoBean p : this.products.keySet()) {
			if(product.getId().equals(p.getId())) {
				products.remove(p);
			}
		}

		
	}

}
	

	
