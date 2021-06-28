/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cart;

import dtos.FlowerDTO;
import java.io.Serializable;

/**
 *
 * @author AD
 */
public class CartItem implements Serializable {
    private FlowerDTO flower;
    private int quantity;

    public CartItem() {
    }

    public CartItem(FlowerDTO flower, int quantity) {
        this.flower = flower;
        this.quantity = quantity;
    }

    public FlowerDTO getFlower() {
        return flower;
    }

    public void setFlower(FlowerDTO flower) {
        this.flower = flower;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
}
