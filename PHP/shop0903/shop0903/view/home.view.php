<?php
$slideArray = $data['slideArray'];
$featuredArrayProducts = $data['featuredArrayProducts'];
$bestSellerProductsArray = $data['bestSellerProductsArray'];
$newProductsArray = $data['newProductsArray'];
$tenMien = 'http://172.20.10.3/api/shop/';
?>
    <!-- Home Slider Start -->
    <div class="slider">
      <div class="tp-banner-container clearfix">
        <div class="tp-banner">
          <ul>
            <!-- SLIDE 1 -->
            <?php foreach ($slideArray as $slide): ?>
            <li data-transition="slidehorizontal" data-slotamount="5" data-masterspeed="700">
              <!-- MAIN IMAGE -->
              <img src="public/source/images/slider/<?=$slide->image?>" alt="slidebg1" data-bgfit="cover" data-bgposition="center center" data-bgrepeat="no-repeat">
              <!-- LAYERS -->
              <!-- LAYER NR. 1 -->
              <div class="tp-caption very_big_white skewfromrightshort fadeout" data-x="center" data-y="100" data-speed="500" data-start="1200"
                data-easing="Circ.easeInOut" style=" font-size:70px; font-weight:800; color:#fe0100;">Huge
                <span style=" color:#000;">sale</span>
              </div>

              <!-- LAYER NR. 2 -->
              <div class="tp-caption tp-caption medium_text skewfromrightshort fadeout" data-x="center" data-y="165" data-hoffset="0" data-voffset="-73"
                data-speed="500" data-start="1200" data-easing="Power4.easeOut" style=" font-size:20px; font-weight:500; color:#337ab7;">
              <?=$slide->title?> </div>

              <!-- LAYER NR. 3 -->
              <div class="tp-caption customin tp-resizeme rs-parallaxlevel-0" data-x="center" data-y="210" data-hoffset="0" data-voffset="98"
                data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                data-speed="500" data-start="1500" data-easing="Power3.easeInOut" data-splitin="none" data-splitout="none"
                data-elementdelay="0.1" data-endelementdelay="0.1" data-linktoslide="next" style="border: 2px solid #fed700;border-radius: 50px; font-size:14px; background-color:#fed700; color:#333; z-index: 12; max-width: auto; max-height: auto; white-space: nowrap; letter-spacing:1px;">
                <a href='#' class='largebtn slide1'>Learn More</a>
              </div>
            </li>
            <?php endforeach?>
          </ul>
        </div>
      </div>
    </div>

    <!-- main container -->
    <div class="main-container col1-layout">
      <div class="container">
        <div class="row">

          <!-- Home Tabs  -->
          <div class="col-sm-12 col-md-12 col-xs-12">
            <div class="home-tab">
              <ul class="nav home-nav-tabs home-product-tabs">
                <li class="active">
                  <a href="#featured" data-toggle="tab" aria-expanded="false">Sản phẩm nổi bật</a>
                </li>
                <li class="divider"></li>
                <li>
                  <a href="#top-sellers" data-toggle="tab" aria-expanded="false">Sản phẩm bán chạy</a>
                </li>
              </ul>
              <div id="productTabContent" class="tab-content">
                <div class="tab-pane active in" id="featured">
                  <div class="featured-pro">
                    <div class="slider-items-products">
                      <div id="featured-slider" class="product-flexslider hidden-buttons">
                        <div class="slider-items slider-width-col4">
                          <?php foreach ($featuredArrayProducts as $item): ?>
                          <div class="product-item">
                            <div class="item-inner">
                              <div class="product-thumbnail">
                                <?php if ($item->promotion_price != 0): ?>
                                <div class="icon-sale-label sale-left">Sale</div>
                                <?php endif?>
                                <?php if ($item->new == 1): ?>
                                <div class="icon-new-label new-right">New</div>
                                <?php endif?>

                                <div class="pr-img-area">
                                  <!-- detail.php?alias=iphone-x-64gb&id=2 -->
                                    <figure>
                                      <img class="first-img" src="public/source/images/products/<?=$item->image?>" alt="html template">
                                      <img class="hover-img" src="public/source/images/products/<?=$item->image?>" alt="html template">
                                    </figure>
                                  </a>
                                  <button id-sp="<?=$item->id?>" type="button" class="add-to-cart-mt">
                                    <i class="fa fa-shopping-cart"></i>
                                    <span> Add to Cart</span>
                                  </button>
                                </div>
                              </div>
                              <div class="item-info">
                                <div class="info-inner">
                                  <div class="item-title">
                                    <a title="<?=$item->name?>" href="<?=json_decode(file_get_contents($tenMien.'selectUrlByIdPro?id=' . $item->id))?>-<?=$item->id?>"> <?=$item->name?> </a>

                                  </div>
                                  <div class="item-content">
                                  <div class="item-price">
                                    <div class="price-box">
                                      <?php if ($item->promotion_price != 0): ?>
                                      <p class="special-price">
                                        <span class="price"> $<?=number_format($item->promotion_price)?> </span>
                                      </p>
                                      <p class="old-price">
                                        <span class="price">$ <?=number_format($item->price)?></span>
                                      </p>
                                      <?php else: ?>
                                      <p class="special-price">
                                        <span class="price">$ <?=number_format($item->price)?> </span>
                                      </p>
                                      <?php endif?>
                                    </div>
                                  </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <?php endforeach?>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="tab-pane fade" id="top-sellers">
                  <div class="top-sellers-pro">
                    <div class="slider-items-products">
                      <div id="top-sellers-slider" class="product-flexslider hidden-buttons">
                        <div class="slider-items slider-width-col4 ">
                          <?php foreach ($bestSellerProductsArray as $p): ?>
                          <div class="product-item">
                            <div class="item-inner">
                              <div class="product-thumbnail">
                                <?php if ($p->promotion_price != 0): ?>
                                <div class="icon-sale-label sale-left">Sale</div>
                                <?php endif?>
                                <?php if ($p->new == 1): ?>
                                <div class="icon-new-label new-right">New</div>
                                <?php endif?>

                                <div class="pr-img-area">
                                  <!-- detail.php?alias=iphone-x-64gb&id=2 -->
                                    <figure>
                                      <img class="first-img" src="public/source/images/products/<?=$p->image?>" alt="html template">
                                      <img class="hover-img" src="public/source/images/products/<?=$p->image?>" alt="html template">
                                    </figure>
                                  </a>
                                  <button id-sp="<?=$p->id?>" type="button" class="add-to-cart-mt">
                                    <i class="fa fa-shopping-cart"></i>
                                    <span> Add to Cart</span>
                                  </button>
                                </div>
                              </div>
                              <div class="item-info">
                                <div class="info-inner">
                                  <div class="item-title">
                                  <a title="<?=$p->name?>" href="<?=json_decode(file_get_contents($tenMien.'selectUrlByIdPro?id=' . $p->id))?>-<?=$p->id?>"> <?=$p->name?> </a>
                                  </div>
                                  <div class="item-content">
                                  <div class="item-price">
                                    <div class="price-box">
                                      <?php if ($p->promotion_price != 0): ?>
                                      <p class="special-price">
                                        <span class="price"> $<?=number_format($p->promotion_price)?> </span>
                                      </p>
                                      <p class="old-price">
                                        <span class="price">$ <?=number_format($p->price)?></span>
                                      </p>
                                      <?php else: ?>
                                      <p class="special-price">
                                        <span class="price">$ <?=number_format($p->price)?> </span>
                                      </p>
                                      <?php endif?>
                                    </div>
                                  </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <?php endforeach?>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>
      </div>
    </div>
    <!-- end main container -->

    <!--special-products-->

    <div class="container">
      <div class="special-products">
        <div class="page-header">
          <h2>Sản phẩm mới</h2>
        </div>
        <div class="special-products-pro">
          <div class="slider-items-products">
            <div id="special-products-slider" class="product-flexslider hidden-buttons">
              <div class="slider-items slider-width-col4">
               <?php foreach ($newProductsArray as $p): ?>
                  <div class="product-item">
                    <div class="item-inner">
                      <div class="product-thumbnail">
                        <?php if ($p->promotion_price != 0): ?>
                        <div class="icon-sale-label sale-left">Sale</div>
                        <?php endif?>
                        <?php if ($p->new == 1): ?>
                        <div class="icon-new-label new-right">New</div>
                        <?php endif?>

                        <div class="pr-img-area">
                          <!-- detail.php?alias=iphone-x-64gb&id=2 -->
                            <figure>
                              <img class="first-img" src="public/source/images/products/<?=$p->image?>" alt="html template">
                              <img class="hover-img" src="public/source/images/products/<?=$p->image?>" alt="html template">
                            </figure>
                          </a>
                          <button  id-sp="<?=$p->id?>" type="button" class="add-to-cart-mt">
                            <i class="fa fa-shopping-cart"></i>
                            <span> Add to Cart</span>
                          </button>
                        </div>
                      </div>
                      <div class="item-info">
                        <div class="info-inner">
                          <div class="item-title">
                          <a title="<?=$p->name?>" href="<?=json_decode(file_get_contents($tenMien.'selectUrlByIdPro?id=' . $p->id))?>-<?=$p->id?>"> <?=$p->name?> </a>
                            
                          </div>
                          <div class="item-content">
                          <div class="item-price">
                            <div class="price-box">
                              <?php if ($p->promotion_price != 0): ?>
                              <p class="special-price">
                                <span class="price">$ <?=number_format($p->promotion_price)?> </span>
                              </p>
                              <p class="old-price">
                                <span class="price">$ <?=number_format($p->price)?></span>
                              </p>
                              <?php else: ?>
                              <p class="special-price">
                                <span class="price">$ <?=number_format($p->price)?> </span>
                              </p>
                              <?php endif?>
                            </div>
                          </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                <?php endforeach?>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- category area start -->
    <div class="jtv-category-area">
      <div class="container">
        <div class="row">
          <div class="col-md-4 col-sm-6">
            <div class="jtv-single-cat">
              <h2 class="cat-title">On New</h2>
              <?php for ($i = 5; $i > 2; $i--): ?>

              <div class="jtv-product jtv-cat-margin">
                <div class="product-img">
                <a href="<?=json_decode(file_get_contents($tenMien.'selectUrlByIdPro?id=' . $newProductsArray[$i]->id))?>-<?=$newProductsArray[$i]->id?>"></a>
                    <img src="public/source/images/products/<?=$newProductsArray[$i]->image?>" alt="html template">
                    <img class="secondary-img" src="public/source/images/products/<?=$newProductsArray[$i]->image?>" alt="html template"> </a>
                </div>
                <div class="jtv-product-content">
                  <h3>
                  <a href="<?=json_decode(file_get_contents($tenMien.'selectUrlByIdPro?id=' . $newProductsArray[$i]->id))?>-<?=$newProductsArray[$i]->id?>"><?=$newProductsArray[$i]->name?></a>
                  </h3>
                  <div class="price-box">
                  <?php if ($newProductsArray[$i]->promotion_price == 0): ?>
                      <span class="regular-price">
                        <span class="price">$<?=number_format($newProductsArray[$i]->price)?> </span>
                      </span>
                      <?php else: ?>
                      <p class="special-price">
                        <span class="price-label">Special Price</span>
                        <span class="price">$<?=number_format($newProductsArray[$i]->promotion_price)?> </span>
                      </p>
                      <br>
                      <p class="old-price">
                        <span class="price-label">Regular Price:</span>
                        <span class="price"> $<?=number_format($newProductsArray[$i]->price)?> </span>
                      </p>
                      <?php endif?>
                  </div>
                  <div class="jtv-product-action">
                    <div class="jtv-extra-link">
                      <div class="button-cart">
                        <button>
                          <i class="fa fa-shopping-cart"></i>
                        </button>
                      </div>

                    </div>
                  </div>
                </div>
              </div>
              <?php endfor?>
            </div>
          </div>
          <div class="col-md-4 col-sm-6">
            <div class="jtv-single-cat">
              <h2 class="cat-title">Featured</h2>
              <?php for ($i = 0; $i < 3; $i++): ?>

              <div class="jtv-product jtv-cat-margin">
                <div class="product-img">
                <a href="<?=json_decode(file_get_contents($tenMien.'selectUrlByIdPro?id=' . $featuredArrayProducts[$i]->id))?>-<?=$featuredArrayProducts[$i]->id?>"></a>
                    <img src="public/source/images/products/<?=$featuredArrayProducts[$i]->image?>" alt="html template">
                    <img class="secondary-img" src="public/source/images/products/<?=$featuredArrayProducts[$i]->image?>" alt="html template"> </a>
                </div>
                <div class="jtv-product-content">
                  <h3>
                  <a href="<?=json_decode(file_get_contents($tenMien.'selectUrlByIdPro?id=' . $featuredArrayProducts[$i]->id))?>-<?=$featuredArrayProducts[$i]->id?>"><?=$featuredArrayProducts[$i]->name?></a>
                  </h3>
                  <div class="price-box">
                  <?php if ($featuredArrayProducts[$i]->promotion_price == 0): ?>
                      <span class="regular-price">
                        <span class="price">$<?=number_format($featuredArrayProducts[$i]->price)?> </span>
                      </span>
                      <?php else: ?>
                      <p class="special-price">
                        <span class="price-label">Special Price</span>
                        <span class="price">$<?=number_format($featuredArrayProducts[$i]->promotion_price)?> </span>
                      </p>
                      <br>
                      <p class="old-price">
                        <span class="price-label">Regular Price:</span>
                        <span class="price"> $<?=number_format($featuredArrayProducts[$i]->price)?> </span>
                      </p>
                      <?php endif?>
                  </div>
                  <div class="jtv-product-action">
                    <div class="jtv-extra-link">
                      <div class="button-cart">
                        <button>
                          <i class="fa fa-shopping-cart"></i>
                        </button>
                      </div>

                    </div>
                  </div>
                </div>
              </div>
              <?php endfor?>
            </div>
          </div>
          <!-- service area start -->
          <div class="col-md-4 col-sm-12 col-xs-12">
            <div class="jtv-service-area">

              <!-- jtv-single-service start -->

              <div class="jtv-single-service">
                <div class="service-icon">
                  <img alt="html template" src="public/source/images/customer-service-icon.png"> </div>
                <div class="service-text">
                  <h2>24/7 customer service</h2>
                  <p>
                    <span>Call us 24/7 at 000 - 123 - 456</span>
                  </p>
                </div>
              </div>
              <div class="jtv-single-service">
                <div class="service-icon">
                  <img alt="html template" src="public/source/images/shipping-icon.png"> </div>
                <div class="service-text">
                  <h2>free shipping worldwide</h2>
                  <p>
                    <span>On order over $199 - 7 days a week</span>
                  </p>
                </div>
              </div>
              <div class="jtv-single-service">
                <div class="service-icon">
                  <img alt="html template" src="public/source/images/guaratee-icon.png"> </div>
                <div class="service-text">
                  <h2>money back guaratee!</h2>
                  <p>
                    <span>Send within 30 days</span>
                  </p>
                </div>
              </div>

              <!-- jtv-single-service end -->

            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- category-area end -->


