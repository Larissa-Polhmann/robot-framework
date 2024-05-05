*** Variables ***
## LOGIN
${USERNAME}               id=user-name
${PASSWORD}               id=password
${BTN_LOGIN}              id=login-button
${MESSAGE_LOCKED_USER}    //h3[contains(.,'Epic sadface: Sorry, this user has been locked out.')]

## HOME PAGE
${HOME_TITLE}           //span[contains(.,'Products')]
${FILTER}               //select[@class='product_sort_container']
${A_TO_Z}               xpath://span[@class="active_option" and contains(text(), "Name (A to Z)")]
${FIRST_ITEM_A_TO_Z}    (//div[contains(@class,'name ')])[1]
${Z_TO_A}               xpath://span[@class="active_option" and contains(text(), "Name (Z to A)")]
${ITEM_PRICE}           xpath=//div[@class='inventory_item_price']
${ADD_TO_CART}          (//button[contains(.,'Add to cart')])[1]
${ADD_SECOND_ITEM}      (//button[contains(.,'Add to cart')])[2]
${1_ITEM}               //span[contains(.,'1')]
${2_ITEMS}              //span[contains(.,'2')]
${CART}                 //a[@data-test='shopping-cart-link']
${BTN_REMOVE}           //button[contains(.,'Remove')]
${MENU}                 //button[@id='react-burger-menu-btn']
${LOGOUT}               //a[contains(.,'Logout')]

## CART
${1_ITEM_CART}           //div[@class='cart_quantity'][contains(.,'1')]
${CART_TITLE}            //span[contains(.,'Your Cart')]
${CONTINUE_SHOPPING}     id=continue-shopping
${CART_LIST}             xpath=//div[@class='cart_list']//div[@class='cart_item']
${REMOVE_FIRST_ITEM}     (//button[contains(.,'Remove')])[1]
${REMOVE_SECOND_ITEM}    (//button[contains(.,'Remove')])[2]
${BTN_CHECKOUT}          id=checkout


## CHECKOUT
${CHECKOUT_TITLE}        //span[contains(.,'Checkout: Your Information')]
${FIRST_NAME}            id=first-name
${LAST_NAME}             id=last-name
${POSTAL_CODE}           id=postal-code
${BTN_CONTINUE}          id=continue
${BTN_CANCEL}            id=cancel
${FIRST_NAME_ERROR}      //h3[contains(.,'Error: First Name is required')]
${LAST_NAME_ERROR}       //h3[contains(.,'Error: Last Name is required')]
${POSTAL_CODE_ERROR}     //h3[contains(.,'Error: Postal Code is required')]


## REVIEW ORDER
${REVIEW_TITLE}         //span[contains(.,'Checkout: Overview')]
${SUBTOTAL}             //div[@data-test='subtotal-label']
${TAX}                  xpath=//div[@data-test='tax-label']
${BTN_FINISH}           //button[@name='finish']
${MESSAGE}              //h2[contains(.,'Thank you for your order!')]