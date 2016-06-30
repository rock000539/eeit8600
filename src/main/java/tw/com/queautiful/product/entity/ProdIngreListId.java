package tw.com.queautiful.product.entity;

import java.io.Serializable;

public class ProdIngreListId implements Serializable{

	protected Long prodId;
    protected Long ingredId;

    public ProdIngreListId() {}

    public ProdIngreListId(Long prodId,Long ingredId) {
        this.prodId = prodId;
        this.ingredId = ingredId;
    }
}
