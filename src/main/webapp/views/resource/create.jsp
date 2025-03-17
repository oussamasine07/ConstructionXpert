
    <jsp:include page="/views/parcials/header.jsp" />

        <div class="p-4 mx-auto max-w-screen-2xl md:p-6">
            <!-- Breadcrumb Start -->
              <div x-data="{ pageName: `Basic Tables`}">
                <div class="mb-6 flex flex-wrap items-center justify-between gap-3">
                  <h2 class="text-xl font-semibold text-gray-800 dark:text-white/90">New Resource</h2>

                  <nav>
                    <ol class="flex items-center gap-1.5">
                      <li>
                        <a class="inline-flex items-center gap-1.5 text-sm text-gray-500 dark:text-gray-400"
                          href="${pageContext.request.contextPath}">
                          Home
                          <svg class="stroke-current" width="17" height="16" viewBox="0 0 17 16" fill="none"
                            xmlns="http://www.w3.org/2000/svg">
                            <path d="M6.0765 12.667L10.2432 8.50033L6.0765 4.33366" stroke="" stroke-width="1.2"
                              stroke-linecap="round" stroke-linejoin="round" />
                          </svg>
                        </a>
                      </li>
                      <li class="text-sm text-gray-800 dark:text-white/90">new Resource</li>
                    </ol>
                  </nav>
                </div>
              </div>
              <!-- Breadcrumb End -->

              <div class="space-y-5 sm:space-y-6">
                  <div class="rounded-2xl border border-gray-200 bg-white dark:border-gray-800 dark:bg-white/[0.03]">
                    <div class="px-5 py-4 sm:px-6 sm:py-5 flex justify-between items-center">
                      <h3 class="text-base font-medium text-gray-800 dark:text-white/90">
                        Resources
                      </h3>
                    </div>
                    <div class="p-5 border-t border-gray-100 dark:border-gray-800 sm:p-6">
                      <!-- ====== Table Six Start -->
                      <div class="overflow-hidden rounded-xl border border-gray-200 bg-white dark:border-gray-800 dark:bg-white/[0.03]">
                        <div class="max-w-full overflow-x-auto">

                            <form action="${pageContext.request.contextPath}/resource/create" method="POST">
                                <div>
                                    <label class="mb-1.5 block text-sm font-medium text-gray-700 dark:text-gray-400">
                                      Supplier name
                                    </label>
                                    <input name="supplierName" type="text" placeholder="Supplier name"
                                      class="dark:bg-dark-900 h-11 w-full rounded-lg border border-gray-300 bg-transparent px-4 py-2.5 text-sm text-gray-800 shadow-theme-xs placeholder:text-gray-400 focus:border-brand-300 focus:outline-none focus:ring focus:ring-brand-500/10 dark:border-gray-700 dark:bg-gray-900 dark:text-white/90 dark:placeholder:text-white/30 dark:focus:border-brand-800" />
                                  </div>
                                  <div>
                                      <label class="mb-1.5 block text-sm font-medium text-gray-700 dark:text-gray-400">
                                        Supplier email
                                      </label>
                                      <input name="supplierEmail" type="text" placeholder="Supplier email"
                                        class="dark:bg-dark-900 h-11 w-full rounded-lg border border-gray-300 bg-transparent px-4 py-2.5 text-sm text-gray-800 shadow-theme-xs placeholder:text-gray-400 focus:border-brand-300 focus:outline-none focus:ring focus:ring-brand-500/10 dark:border-gray-700 dark:bg-gray-900 dark:text-white/90 dark:placeholder:text-white/30 dark:focus:border-brand-800" />
                                  </div>
                                  <div>
                                        <label class="mb-1.5 block text-sm font-medium text-gray-700 dark:text-gray-400">
                                          Supplier phone
                                        </label>
                                        <input name="supplierPhone" type="text" placeholder="Supplier phone"
                                          class="dark:bg-dark-900 h-11 w-full rounded-lg border border-gray-300 bg-transparent px-4 py-2.5 text-sm text-gray-800 shadow-theme-xs placeholder:text-gray-400 focus:border-brand-300 focus:outline-none focus:ring focus:ring-brand-500/10 dark:border-gray-700 dark:bg-gray-900 dark:text-white/90 dark:placeholder:text-white/30 dark:focus:border-brand-800" />
                                  </div>
                                  <div>
                                      <label class="mb-1.5 block text-sm font-medium text-gray-700 dark:text-gray-400">
                                        Supplier address
                                      </label>
                                      <input name="supplierAddress" type="text" placeholder="Supplier address"
                                        class="dark:bg-dark-900 h-11 w-full rounded-lg border border-gray-300 bg-transparent px-4 py-2.5 text-sm text-gray-800 shadow-theme-xs placeholder:text-gray-400 focus:border-brand-300 focus:outline-none focus:ring focus:ring-brand-500/10 dark:border-gray-700 dark:bg-gray-900 dark:text-white/90 dark:placeholder:text-white/30 dark:focus:border-brand-800" />
                                </div>

                                <div>
                                    <label class="mb-1.5 block text-sm font-medium text-gray-700 dark:text-gray-400">
                                      Product name
                                    </label>
                                    <input name="productName" type="text" placeholder="Product name"
                                      class="dark:bg-dark-900 h-11 w-full rounded-lg border border-gray-300 bg-transparent px-4 py-2.5 text-sm text-gray-800 shadow-theme-xs placeholder:text-gray-400 focus:border-brand-300 focus:outline-none focus:ring focus:ring-brand-500/10 dark:border-gray-700 dark:bg-gray-900 dark:text-white/90 dark:placeholder:text-white/30 dark:focus:border-brand-800" />
                                </div>
                                <div>
                                    <label class="mb-1.5 block text-sm font-medium text-gray-700 dark:text-gray-400">
                                      Quantity
                                    </label>
                                    <input name="productQuantity" type="text" placeholder="Product quantity"
                                      class="dark:bg-dark-900 h-11 w-full rounded-lg border border-gray-300 bg-transparent px-4 py-2.5 text-sm text-gray-800 shadow-theme-xs placeholder:text-gray-400 focus:border-brand-300 focus:outline-none focus:ring focus:ring-brand-500/10 dark:border-gray-700 dark:bg-gray-900 dark:text-white/90 dark:placeholder:text-white/30 dark:focus:border-brand-800" />
                                </div>

                                <div>
                                    <label class="mb-1.5 block text-sm font-medium text-gray-700 dark:text-gray-400">
                                      Unit price
                                    </label>
                                    <input name="unitPrice" type="text" placeholder="Unit price"
                                      class="dark:bg-dark-900 h-11 w-full rounded-lg border border-gray-300 bg-transparent px-4 py-2.5 text-sm text-gray-800 shadow-theme-xs placeholder:text-gray-400 focus:border-brand-300 focus:outline-none focus:ring focus:ring-brand-500/10 dark:border-gray-700 dark:bg-gray-900 dark:text-white/90 dark:placeholder:text-white/30 dark:focus:border-brand-800" />
                                </div>


                            </form>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
        </div>

    <jsp:include page="/views/parcials/footer.jsp" />