json.id @product.id
json.name @product.name
json.price @product.price
json.cause_id @product.cause_id
json.qty @carted_product ? @product.qty - @carted_product.qty : @product.qty
json.description @product.description
json.image_url @product.image_url
json.user_id @product.user_id
json.cause @product.cause