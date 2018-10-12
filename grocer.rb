require "pry"

def consolidate_cart(array)
  answerHash = {}
array.each do |each_item_hash|
     counter = array.count(each_item_hash)
  each_item_hash.each do |name, detail_hash|
    if answerHash[name] != nil
      nil
    else
      answerHash[name] = detail_hash
      answerHash[name][:count] = counter
    end
  end
end
   answerHash 
end

def apply_coupons(cart, coupons)
 answerCart = cart
 coupons.each do |each_item_hash|
   item = each_item_hash[:item]
   if cart.keys.include?(item) && cart[item][:count]>= each_item_hash[:num]
     temp_hash = {"#{item} W/COUPON" => {:price => each_item_hash[:cost], :clearance => cart[item][:clearance], :count => 1}}
     if answerCart.keys.include?("#{item} W/COUPON") 
       answerCart["#{item} W/COUPON"][:count] += 1
     else
       answerCart.merge!(temp_hash)
     end
     answerCart[item][:count] -= each_item_hash[:num]
   end
 end
 answerCart
     
end

def apply_clearance(cart)
  
  cart.each do |name, detail_hash|
    if detail_hash[:clearance] == true
      detail_hash[:price]*= 0.8
      detail_hash[:price].round(2)
    end
  end
  cart
end

def checkout(cart, coupons)
  # code here
end