# Core Tips


# Shop Tips
## Disable EMail from Checkout page
Add these lines to functions.php 
```
add_filter( 'woocommerce_billing_fields', 'email_optional_field');
 
function email_optional_field( $fields ) {
$fields['billing_email']['required'] = false;
unset( $fields['billing_email']);
return $fields;
}
```
src: [text](https://mahdisweb.net/blog/make-the-email-field-optional-on-the-checkout-page/)
# Plugin Tips
