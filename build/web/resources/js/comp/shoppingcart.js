const cart = {
    props:['cart'],
    template: `
        <tbody>
            <tr v-for="(car,i) in cart" class="cart_item">
                <td class="product-remove">
                    <a href="#" class="remove" title="Remove this item" data-product_id="22" data-product_sku="">×</a>
                </td>
                <td class="product-thumbnail">
                    <a href="#">
                        <img src="/BuySellCar/resources/client/images/_shop/small1.jpg" class="" alt="Kallyas Product" title="Kallyas Produc" style="height:80px;"/>
                    </a>
                </td>
                <td class="product-name">
                    <a href="#">{{car.make}} {{car.modelname}} {{car.typename}}</a>
                </td>
                <td class="product-price">
                    <span class="amount">NGN{{car.price}}</span>
                </td>
                
                <td class="product-subtotal">
                    <span class="amount">
                            {{car.price | currency}}
                    </span>
                </td>
            </tr>

            <tr>
                <td colspan="6" class="actions">
                    <div class="coupon">
                        <label for="coupon_code">Coupon:</label><input type="text" name="coupon_code" class="input-text" id="coupon_code" value="" placeholder="Coupon code"><input type="submit" class="button" name="apply_coupon" value="Apply Coupon"/>
                    </div>
                    <input type="submit" class="button" name="update_cart" value="Update Cart">
                    <input type="hidden" id="_wpnonce" name="_wpnonce" value="1b98fc7d5b"><input type="hidden" name="_wp_http_referer" value="/demo/cart/">
                </td>
            </tr>
        </tbody>
    `
}

define(function() {
    return cart;
})