<%@ page import="com.ConstructionXpert.model.Supplier, java.util.*, com.ConstructionXpert.dto.*" %>

<%
    List<Supplier> suppliers = (List<Supplier>) request.getAttribute("suppliers");
    Map<String, String> errors = (Map<String, String>) session.getAttribute("errors");
    session.removeAttribute("errors");

    ResourceDTO old = (ResourceDTO) session.getAttribute("old");
    session.removeAttribute("old");


%>

<jsp:include page="/views/parcials/header.jsp"/>

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
                                      stroke-linecap="round" stroke-linejoin="round"/>
                            </svg>
                        </a>
                    </li>
                    <li class="text-sm text-gray-800 dark:text-white/90">new Resource</li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <div class="rounded-2xl border border-gray-200 bg-white dark:border-gray-800 dark:bg-white/[0.03]">
        <div class="px-5 py-4 sm:px-6 sm:py-5">
            <h3 class="text-base font-medium text-gray-800 dark:text-white/90">
                Resource
            </h3>
        </div>

        <div class="space-y-6 border-t border-gray-100 p-5 sm:p-6 dark:border-gray-800">
            <!-- Elements -->
            <form action="${pageContext.request.contextPath}/resource/create" method="POST">
                <div class="mb-5">
                    <label class="mb-1.5 block text-sm font-medium text-gray-700 dark:text-gray-400">
                        Supplier
                    </label>
                    <div x-data="{ isOptionSelected: false }" class="relative z-20 bg-transparent">
                        <select name="supplier"
                                class="dark:bg-dark-900 shadow-theme-xs focus:border-brand-300 focus:ring-brand-500/10 dark:focus:border-brand-800 h-11 w-full appearance-none rounded-lg border border-gray-300 bg-transparent bg-none px-4 py-2.5 pr-11 text-sm text-gray-800 placeholder:text-gray-400 focus:ring-3 focus:outline-hidden dark:border-gray-700 dark:bg-gray-900 dark:text-white/90 dark:placeholder:text-white/30"
                                :class="isOptionSelected && 'text-gray-800 dark:text-white/90'"
                                @change="isOptionSelected = true">

                            <% for (Supplier sup : suppliers) { %>
                            <option value="<%= sup.getSupplierId() %>"
                                    class="text-gray-700 dark:bg-gray-900 dark:text-gray-400">
                                <%= sup.getName() %>
                            </option>
                            <% } %>

                        </select>
                        <span
                                class="pointer-events-none absolute top-1/2 right-4 z-30 -translate-y-1/2 text-gray-500 dark:text-gray-400">
                                <svg class="stroke-current" width="20" height="20" viewBox="0 0 20 20" fill="none"
                                     xmlns="http://www.w3.org/2000/svg">
                                  <path d="M4.79175 7.396L10.0001 12.6043L15.2084 7.396" stroke="" stroke-width="1.5"
                                        stroke-linecap="round" stroke-linejoin="round"/>
                                </svg>
                              </span>
                    </div>
                </div>
                <div class="mb-5">
                    <label class="mb-1.5 block text-sm font-medium text-gray-700 dark:text-gray-400">
                        Name
                    </label>
                    <div class="relative">
                        <input type="text" value="<%= old != null ? old.getName() : "" %>" name="name"
                               placeholder="Enter resource name"
                               class="dark:bg-dark-900 shadow-theme-xs focus:border-brand-300 focus:ring-brand-500/10 dark:focus:border-brand-800 h-11 w-full rounded-lg border border-gray-300 bg-transparent px-4 py-2.5 text-sm text-gray-800 placeholder:text-gray-400 focus:ring-3 focus:outline-hidden dark:border-gray-700 dark:bg-gray-900 dark:text-white/90 dark:placeholder:text-white/30"/>
                    </div>
                    <% if (errors != null && errors.containsKey("name")) { %>
                    <p class="text-theme-xs text-error-500 mt-1.5">
                        <%= errors.get("name") %>
                    </p>
                    <% } %>
                </div>
                <div class="mb-5">
                    <label class="mb-1.5 block text-sm font-medium text-gray-700 dark:text-gray-400">
                        Quantity
                    </label>
                    <div class="relative">
                        <input type="number" value="<%= old != null ? old.getQuantity() : "" %>" name="quantity"
                               placeholder="Enter resource quantity"
                               class="dark:bg-dark-900 shadow-theme-xs focus:border-brand-300 focus:ring-brand-500/10 dark:focus:border-brand-800 h-11 w-full rounded-lg border border-gray-300 bg-transparent px-4 py-2.5 text-sm text-gray-800 placeholder:text-gray-400 focus:ring-3 focus:outline-hidden dark:border-gray-700 dark:bg-gray-900 dark:text-white/90 dark:placeholder:text-white/30"/>
                    </div>

                    <% if (errors != null && errors.containsKey("quantity")) { %>
                    <p class="text-theme-xs text-error-500 mt-1.5">
                        <%= errors.get("quantity") %>
                    </p>
                    <% } %>
                </div>
                <div class="mb-5">
                    <label class="mb-1.5 block text-sm font-medium text-gray-700 dark:text-gray-400">
                        Unit price
                    </label>
                    <div class="relative">
                        <input type="text" value="<%= old != null ? old.getUnitPrice() : "" %>" name="unitPrice"
                               placeholder="Enter unit price"
                               class="dark:bg-dark-900 shadow-theme-xs focus:border-brand-300 focus:ring-brand-500/10 dark:focus:border-brand-800 h-11 w-full rounded-lg border border-gray-300 bg-transparent px-4 py-2.5 text-sm text-gray-800 placeholder:text-gray-400 focus:ring-3 focus:outline-hidden dark:border-gray-700 dark:bg-gray-900 dark:text-white/90 dark:placeholder:text-white/30"/>
                    </div>

                    <% if (errors != null && errors.containsKey("unitPrice")) { %>
                    <p class="text-theme-xs text-error-500 mt-1.5">
                        <%= errors.get("unitPrice") %>
                    </p>
                    <% } %>
                </div>
                <div>
                    <button type="submit" class="py-2 px-4 bg-blue-light-500 rounded-md text-gray-700 dark:text-white">Create Resource
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<jsp:include page="/views/parcials/footer.jsp"/>