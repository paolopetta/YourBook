package model;

import java.util.ArrayList;

public class WishlistBean {

    ArrayList<LibriBean> items;

    public WishlistBean() {
        items = new ArrayList<LibriBean>();
    }

    public void addItem(LibriBean item) {
        items.add(item);
    }

    public void deleteItem(LibriBean item) {
        for (LibriBean it : items) {
            if (it.getIsbn().equals(item.getIsbn())) {
                items.remove(it);
                break;
            }
        }
    }

    public boolean alReadyIn(LibriBean item) {
        for (LibriBean it : items) {
            if (it.getIsbn().equals(item.isbn)) {
                return true;
            }
        }
        return false;
    }

    public ArrayList<LibriBean> getItems() {
        return items;
    }

    public void deleteAll() {
        items.clear();
    }
}
