/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cart;

import java.util.ArrayList;

/**
 *
 * @author AD
 */
public class Cart extends ArrayList<CartItem> {

    public Cart() {
    }
    
    public void addCart(CartItem item) {
        this.add(item);
    }
    
    public int isExisting(String fID) {
        for(int i = 0; i < this.size(); i++) {
            if(this.get(i).getFlower().getId().equals(fID)) {
                return i;
            }
        }
        return -1;
    }
}
