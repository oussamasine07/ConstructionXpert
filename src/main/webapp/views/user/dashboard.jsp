<%@ page import="com.ConstructionXpert.model.*, java.util.*, java.text.*" %>
<%

    DecimalFormatSymbols symbols = new DecimalFormatSymbols();
    symbols.setGroupingSeparator('.');
    symbols.setDecimalSeparator(',');
    DecimalFormat df = new DecimalFormat("#,###.00", symbols);

    String totalSpent = df.format((Double) request.getAttribute("totalSpent"));
    int countProjects = (Integer) request.getAttribute("countProjects");
    int coutResources = (Integer) request.getAttribute("coutResources");

    List<Project> projects = (List<Project>) request.getAttribute("projects");

%>

<jsp:include page="/views/parcials/header.jsp"/>

<div class="p-4 mx-auto max-w-screen-2xl md:p-6">
    <div class="my-3 md:my-6 grid gap-3 grid-cols-3 ">
        <div class="col-span-1 rounded-2xl border border-gray-200 bg-white p-2 dark:border-gray-800 dark:bg-white/[0.03] md:p-4">
            <div class="flex h-12 w-12 items-center justify-center rounded-xl bg-gray-100 dark:bg-gray-800">
                <i class="fa-solid fa-diagram-project fill-white" style="font-size: 24px; color: #959ea9"></i>
            </div>

            <div class="mt-5 flex items-end justify-between">
                <div>
                    <span class="text-sm text-gray-500 dark:text-gray-400">Total Project</span>
                    <h4 class="mt-2 text-md font-bold text-gray-800 dark:text-white/90"> <%= countProjects %> </h4>
                </div>
                <span class="flex items-center gap-1 rounded-full bg-success-50 py-0.5 pl-2 pr-2.5 text-sm font-medium text-success-600 dark:bg-success-500/15 dark:text-success-500"> Running </span>
            </div>
        </div>

        <div class="col-span-1 rounded-2xl border border-gray-200 bg-white p-2 dark:border-gray-800 dark:bg-white/[0.03] md:p-4">
            <div class="flex h-12 w-12 items-center justify-center rounded-xl bg-gray-100 dark:bg-gray-800">
                <i class="fa-solid fa-comment-dollar"  style="font-size: 24px; color: #959ea9"></i>
            </div>

            <div class="mt-5 flex items-end justify-between">
                <div>
                    <span class="text-sm text-gray-500 dark:text-gray-400">Total Spent</span>
                    <h4 class="mt-2 text-md font-bold text-gray-800 dark:text-white/90"> <%= totalSpent %> DH </h4>
                </div>
                <span class="flex items-center gap-1 rounded-full bg-error-50 py-0.5 pl-2 pr-2.5 text-sm font-medium text-error-600 dark:bg-error-500/15 dark:text-error-500">
                      consumed
                </span>
            </div>
        </div>

        <div class='col-span-1 rounded-2xl border border-gray-200 bg-white p-2 dark:border-gray-800 dark:bg-white/[0.03] md:p-4'>
            <div class="flex h-12 w-12 items-center justify-center rounded-xl bg-gray-100 dark:bg-gray-800">
                <i class="fa-solid fa-boxes-stacked" style="font-size: 24px; color: #959ea9"></i>
            </div>

            <div class="mt-5 flex items-end justify-between">
                <div>
                    <span class="text-sm text-gray-500 dark:text-gray-400">Total Resources</span>
                    <h4 class="mt-2 text-md font-bold text-gray-800 dark:text-white/90"> <%= coutResources %> </h4>
                </div>
                <span class="flex items-center gap-1 rounded-full bg-blue-light-50 py-0.5 pl-2 pr-2.5 text-sm font-medium text-blue-light-600 dark:bg-blue-light-500/15 dark:text-blue-light-500">
                      avialable
                </span>
            </div>
        </div>
    </div>

    <div class="space-y-5 sm:space-y-6">
        <div class="rounded-2xl border border-gray-200 bg-white dark:border-gray-800 dark:bg-white/[0.03]">
            <div class="px-5 py-4 sm:px-6 sm:py-5 flex justify-between items-center">
                <h3 class="text-base font-medium text-gray-800 dark:text-white/90">
                    Last 3 projects
                </h3>

                <a href="${pageContext.request.contextPath}/project/create"
                   class="px-6 py-3 bg-gradient-to-r from-green-500 to-green-700 text-white font-semibold rounded-lg shadow-md hover:from-green-600 hover:to-green-800 transition-all duration-300 flex items-center gap-2">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"
                         xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4"></path>
                    </svg>
                    Create Project
                </a>
            </div>
            <div class="p-5 border-t border-gray-100 dark:border-gray-800 sm:p-6">
                <!-- ====== Table Six Start -->
                <div class="overflow-hidden rounded-xl border border-gray-200 bg-white dark:border-gray-800 dark:bg-white/[0.03]">
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
                                            Stat date
                                        </p>
                                    </div>
                                </th>
                                <th class="px-5 py-3 sm:px-6">
                                    <div class="flex items-center">
                                        <p class="font-medium text-gray-500 text-theme-xs dark:text-gray-400">
                                            End date
                                        </p>
                                    </div>
                                </th>
                                <th class="px-5 py-3 sm:px-6">
                                    <div class="flex items-center">
                                        <p class="font-medium text-gray-500 text-theme-xs dark:text-gray-400">
                                            Budget
                                        </p>
                                    </div>
                                </th>
                                <th class="px-5 py-3 sm:px-6">
                                    <div class="flex items-center">
                                        <p class="font-medium text-gray-500 text-theme-xs dark:text-gray-400">
                                            Actions
                                        </p>
                                    </div>
                                </th>
                            </tr>
                            </thead>
                            <!-- table header end -->
                            <!-- table body start -->
                            <tbody class="divide-y divide-gray-100 dark:divide-gray-800">

                            <% for (Project proj : projects) { %>
                            <tr>
                                <td class="px-5 py-4 sm:px-6">
                                    <div class="flex items-center">
                                        <p class="text-gray-500 text-theme-sm dark:text-gray-200">
                                            <a href="${pageContext.request.contextPath}/tasks?projectId=<%= proj.getProjectId() %>">
                                                <%= proj.getName() %>
                                            </a>
                                        </p>
                                    </div>
                                </td>
                                <td class="px-5 py-4 sm:px-6">
                                    <div class="flex items-center">
                                        <p class="text-gray-500 text-theme-sm dark:text-gray-200">
                                            <%= proj.getStartDate() %>
                                        </p>
                                    </div>
                                </td>
                                <td class="px-5 py-4 sm:px-6">
                                    <div class="flex items-center">
                                        <p class="text-gray-500 text-theme-sm dark:text-gray-200">
                                            <%= proj.getEndDate() %>
                                        </p>
                                    </div>
                                </td>
                                <td class="px-5 py-4 sm:px-6">
                                    <div class="flex items-center">
                                        <p class="text-gray-500 text-theme-sm dark:text-gray-200">
                                            <%= proj.getBudget() %>
                                        </p>
                                    </div>
                                </td>

                                <td class="px-5 py-4 sm:px-6">
                                    <div class="flex items-center">
                                        <a href="${pageContext.request.contextPath}/project/update?id=<%= proj.getProjectId() %>">edit</a>
                                        <form action="${pageContext.request.contextPath}/project/delete?id=<%= proj.getProjectId() %>"
                                              method="POST">
                                            <button type="sumbmit">delete</button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                            <% } %>


                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- ====== Table Six End -->
            </div>
        </div>
    </div>

</div>

<jsp:include page="/views/parcials/footer.jsp"/>