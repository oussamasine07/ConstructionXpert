
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ConstructionXpert.model.*, java.util.*" %>
<%
    Task task = (Task) request.getAttribute("task");
    List<ConsumedResource> consumedResources = (List<ConsumedResource>) request.getAttribute("consumedResources");
    Double cumulativeTotal = (Double) request.getAttribute("cumulativeTotal");

%>
<jsp:include page="/views/parcials/header.jsp" />

<div class="p-4 mx-auto max-w-screen-2xl md:p-6">
    <!-- Breadcrumb Start -->
    <div x-data="{ pageName: `Basic Tables`}">
        <div class="mb-6 flex flex-wrap items-center justify-between gap-3">
            <h2 class="text-2xl font-semibold text-gray-800 dark:text-white/90">Task details</h2>

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
                    <li class="text-sm text-gray-800 dark:text-white/90">details</li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <div class="space-y-5 sm:space-y-6">
        <div class="rounded-2xl border border-gray-200 bg-white dark:border-gray-800 dark:bg-white/[0.03] grid grid-cols-5 gap-3 sm:p-3">
            <div class="border-gray-100 dark:border-gray-800 col-span-2">
                <div class="overflow-hidden rounded-xl border border-gray-200 bg-white dark:border-gray-800 p-2 dark:bg-white/[0.03] sm:p-3">
                    <div class="max-w-full overflow-x-auto">
                        <h2 class="text-xl font-semibold text-gray-800 dark:text-white/90 mb-5"> <%= task.getName() %> </h2>
                        <p class="text-gray-500 text-theme-sm dark:text-gray-50"> <%= task.getDescription() %> </p>
                    </div>
                </div>
            </div>
            <div class="border-gray-100 dark:border-gray-800 col-span-3">
                <div class="overflow-hidden rounded-xl border border-gray-200 bg-white dark:border-gray-800 p-2 dark:bg-white/[0.03] sm:p-3">
                    <div class="max-w-full overflow-x-auto">
                        <h1 class="text-xl font-semibold text-gray-800 dark:text-white/90 mb-5">Consumed resources</h1>

                        <div class="max-w-full overflow-x-auto">
                            <table class="min-w-full">
                                <!-- table header start -->
                                <thead>
                                    <tr class="border-b border-gray-100 dark:border-gray-800">
                                        <th class="px-5 py-3 sm:px-6">
                                            <div class="flex items-center">
                                                <p class="font-medium text-gray-500 text-theme-xs dark:text-gray-400">
                                                    Name
                                                </p>
                                            </div>
                                        </th>
                                        <th class="px-5 py-3 sm:px-6">
                                            <div class="flex items-center">
                                                <p class="font-medium text-gray-500 text-theme-xs dark:text-gray-400">
                                                    Quantity
                                                </p>
                                            </div>
                                        </th>
                                        <th class="px-5 py-3 sm:px-6">
                                            <div class="flex items-center">
                                                <p class="font-medium text-gray-500 text-theme-xs dark:text-gray-400">
                                                    Unit price
                                                </p>
                                            </div>
                                        </th>
                                        <th class="px-5 py-3 sm:px-6">
                                            <div class="flex items-center">
                                                <p class="font-medium text-gray-500 text-theme-xs dark:text-gray-400">
                                                    Total price
                                                </p>
                                            </div>
                                        </th>
                                    </tr>
                                </thead>
                                <!-- table header end -->
                                <!-- table body start -->
                                <tbody class="divide-y divide-gray-100 dark:divide-gray-800">

                                <% for (ConsumedResource consumedResource : consumedResources) { %>
                                    <tr>
                                        <td class="px-5 py-4 sm:px-6">
                                            <div class="flex items-center">
                                                <p class="text-gray-500 text-theme-sm dark:text-gray-200">
                                                    <%= consumedResource.getResource().getName() %>
                                                </p>
                                            </div>
                                        </td>
                                        <td class="px-5 py-4 sm:px-6">
                                            <div class="flex items-center">
                                                <p class="text-gray-500 text-theme-sm dark:text-gray-200">
                                                    <%= consumedResource.getQuantity() %>
                                                </p>
                                            </div>
                                        </td>
                                        <td class="px-5 py-4 sm:px-6">
                                            <div class="flex items-center">
                                                <p class="text-gray-500 text-theme-sm dark:text-gray-200">
                                                    <%= consumedResource.getUnitPrice() %>
                                                </p>
                                            </div>
                                        </td>
                                        <td class="px-5 py-4 sm:px-6">
                                            <div class="flex items-center">
                                                <p class="text-gray-500 text-theme-sm dark:text-gray-200">
                                                    <%= consumedResource.getTotalPrice() %>
                                                </p>
                                            </div>
                                        </td>
                                    </tr>
                                <% } %>
                                <tr>
                                    <td class="px-5 py-4 sm:px-6">
                                        <div class="flex items-center">
                                            <p class="text-gray-500 text-theme-sm dark:text-gray-50">
                                                <strong>Spent Total:</strong>
                                            </p>
                                        </div>
                                    </td>
                                    <td class="px-5 py-4 sm:px-6">

                                    </td>
                                    <td class="px-5 py-4 sm:px-6">

                                    </td>
                                    <td class="px-5 py-4 sm:px-6">
                                        <div class="flex items-center">
                                            <p class="text-gray-500 text-theme-sm dark:text-gray-50">
                                                <strong><%= cumulativeTotal %></strong>
                                            </p>
                                        </div>
                                    </td>
                                </tr>

                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/views/parcials/footer.jsp" />
