<%@ page import="com.ConstructionXpert.model.*, java.util.*, java.text.*" %>
<%
    List<Task> tasks = (List<Task>) request.getAttribute("tasks");
    int projectId = Integer.parseInt(request.getParameter("projectId"));

    DecimalFormatSymbols symbols = new DecimalFormatSymbols();
    symbols.setGroupingSeparator('.');
    symbols.setDecimalSeparator(',');
    DecimalFormat df = new DecimalFormat("#,###.00", symbols);

    Project project = (Project) request.getAttribute("project");
//    double totalSpent = (Double) request.getAttribute("totalSpent");

    String budget = df.format( project.getBudget() );
    String totalSpent = df.format((Double) request.getAttribute("totalSpent"));
    String rest = df.format( project.getBudget() - (Double) request.getAttribute("totalSpent"));

    // calculate percentages
    double spentPercentage = (Double) request.getAttribute("totalSpent") / project.getBudget() * 100;
    double restPercentage = ((project.getBudget() - (Double) request.getAttribute("totalSpent")) / project.getBudget()) * 100;
    String stylingClasses;
    if ( 0 <= restPercentage && restPercentage  <= 33   ) {
        // danger
        stylingClasses = "flex items-center gap-1 rounded-full bg-error-50 py-0.5 pl-2 pr-2.5 text-sm font-medium text-error-600 dark:bg-error-500/15 dark:text-error-500";
    }
    else if ( 34 <= restPercentage && restPercentage  <= 67 ) {
        // warning
        stylingClasses = "flex items-center gap-1 rounded-full bg-warning-50 py-0.5 pl-2 pr-2.5 text-sm font-medium text-warning-600 dark:bg-warning-500/15 dark:text-warning-500";
    }
    else {
        // success
        stylingClasses = "flex items-center gap-1 rounded-full bg-success-50 py-0.5 pl-2 pr-2.5 text-sm font-medium text-success-600 dark:bg-success-500/15 dark:text-success-500";
    }

    int totalTasks = (Integer) request.getAttribute("totalTasks");


%>
<jsp:include page="/views/parcials/header.jsp"/>

<div class="p-4 mx-auto max-w-screen-2xl md:p-6">
    <!-- Breadcrumb Start -->
    <div x-data="{ pageName: `Basic Tables`}">
        <div class="mb-6 flex flex-wrap items-center justify-between gap-3">
            <div>
                <h2 class="text-xl font-semibold text-gray-800 dark:text-white/90">Project: <%= project.getName() %>
                </h2>
                <div class="text-sm font-normal text-gray-700 dark:text-white/60 italic mt-3 flex justify-start items-center">
                    <div>Deadline:</div>
                    <div class="ml-3"> from: <%= project.getStartDate() %>
                    </div>
                    <div class="ml-3">to: <%= project.getEndDate()%>
                    </div>
                </div>
            </div>

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
                    <li class="text-sm text-gray-800 dark:text-white/90">tasks</li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <div class="my-3 md:my-6 grid gap-3 grid-cols-4 ">
        <div class="col-span-1 rounded-2xl border border-gray-200 bg-white p-2 dark:border-gray-800 dark:bg-white/[0.03] md:p-4">
            <div class="flex h-12 w-12 items-center justify-center rounded-xl bg-gray-100 dark:bg-gray-800">
                <i class="fa-solid fa-money-bill-wave fill-white" style="font-size: 24px; color: #959ea9"></i>
            </div>

            <div class="mt-5 flex items-end justify-between">
                <div>
                    <span class="text-sm text-gray-500 dark:text-gray-400">Budget</span>
                    <h4 class="mt-2 text-md font-bold text-gray-800 dark:text-white/90"> <%= budget %> DH </h4>
                </div>
                <span class="flex items-center gap-1 rounded-full bg-success-50 py-0.5 pl-2 pr-2.5 text-sm font-medium text-success-600 dark:bg-success-500/15 dark:text-success-500"> 100,00% </span>
            </div>
        </div>

        <div class="col-span-1 rounded-2xl border border-gray-200 bg-white p-2 dark:border-gray-800 dark:bg-white/[0.03] md:p-4">
            <div class="flex h-12 w-12 items-center justify-center rounded-xl bg-gray-100 dark:bg-gray-800">
                <i class="fa-solid fa-comment-dollar"  style="font-size: 24px; color: #959ea9"></i>
            </div>

            <div class="mt-5 flex items-end justify-between">
                <div>
                    <span class="text-sm text-gray-500 dark:text-gray-400">Spent</span>
                    <h4 class="mt-2 text-md font-bold text-gray-800 dark:text-white/90"> <%= totalSpent %> DH </h4>
                </div>
                <span class="flex items-center gap-1 rounded-full bg-blue-light-50 py-0.5 pl-2 pr-2.5 text-sm font-medium text-blue-light-600 dark:bg-blue-light-500/15 dark:text-blue-light-500">
                      <%= df.format(spentPercentage) %>%
                </span>
            </div>
        </div>

        <div class='col-span-1 rounded-2xl border border-gray-200 bg-white p-2 dark:border-gray-800 dark:bg-white/[0.03] md:p-4'>
            <div class="flex h-12 w-12 items-center justify-center rounded-xl bg-gray-100 dark:bg-gray-800">
                <i class="fas fa-money-check-alt" style="font-size: 24px; color: #959ea9"></i>
            </div>

            <div class="mt-5 flex items-end justify-between">
                <div>
                    <span class="text-sm text-gray-500 dark:text-gray-400">Rest</span>
                    <h4 class="mt-2 text-md font-bold text-gray-800 dark:text-white/90"> <%= rest %> DH </h4>
                </div>
                <span class='<%= stylingClasses %>'>
                      <%= df.format(restPercentage) %>%
                </span>
            </div>
        </div>
        <div class="col-span-1 rounded-2xl border border-gray-200 bg-white p-2 dark:border-gray-800 dark:bg-white/[0.03] md:p-4">
            <div class="flex h-12 w-12 items-center justify-center rounded-xl bg-gray-100 dark:bg-gray-800">
                <i class="fas fa-tasks" style="font-size: 24px; color: #959ea9"></i>
            </div>

            <div class="mt-5 flex items-end justify-between">
                <div>
                    <span class="text-sm text-gray-500 dark:text-gray-400">Tasks</span>
                    <h4 class="mt-2 text-xl font-bold text-gray-800 dark:text-white/90"> <%= totalTasks %> </h4>
                </div>

            </div>
        </div>

    </div>

    <div class='col-span-1 rounded-2xl border border-gray-200 bg-white p-2 dark:border-gray-800 dark:bg-white/[0.03] p-3 md:p-6 my-4'>
        <h2 class="text-md font-semibold text-gray-800 dark:text-white/90 mb-5">Description</h2>
        <p class="text-md font-normal text-gray-800 dark:text-white/80"> <%= project.getDescription() %> </p>
    </div>

    <div class="space-y-5 sm:space-y-6">
        <div class="rounded-2xl border border-gray-200 bg-white dark:border-gray-800 dark:bg-white/[0.03]">
            <div class="px-5 py-4 sm:px-6 sm:py-5 flex justify-between items-center">
                <h3 class="text-base font-medium text-gray-800 dark:text-white/90">
                    Tasks
                </h3>

                <a href="${pageContext.request.contextPath}/tasks/create?projectId=<%= projectId %>"
                   class="px-6 py-3 bg-gradient-to-r from-green-500 to-green-700 text-white font-semibold rounded-lg shadow-md hover:from-green-600 hover:to-green-800 transition-all duration-300 flex items-center gap-2">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"
                         xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4"></path>
                    </svg>
                    Create Task
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
                                            Start date
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
                                            Actions
                                        </p>
                                    </div>
                                </th>
                            </tr>
                            </thead>
                            <!-- table header end -->
                            <!-- table body start -->
                            <tbody class="divide-y divide-gray-100 dark:divide-gray-800">

                            <% for (Task task : tasks) { %>
                            <tr>
                                <td class="px-5 py-4 sm:px-6">
                                    <div class="flex items-center">
                                        <p class="text-gray-500 text-theme-sm dark:text-gray-200">
                                            <a href="${pageContext.request.contextPath}/tasks/show?projectId=<%= task.getProject().getProjectId() %>&taskId=<%= task.getTaskId() %>">
                                                <%= task.getName() %>
                                            </a>
                                        </p>
                                    </div>
                                </td>
                                <td class="px-5 py-4 sm:px-6">
                                    <div class="flex items-center">
                                        <p class="text-gray-500 text-theme-sm dark:text-gray-200">
                                            <%= task.getStartDate() %>
                                        </p>
                                    </div>
                                </td>
                                <td class="px-5 py-4 sm:px-6">
                                    <div class="flex items-center">
                                        <p class="text-gray-500 text-theme-sm dark:text-gray-200">
                                            <%= task.getEndDate() %>
                                        </p>
                                    </div>
                                </td>

                                <td class="px-5 py-4 sm:px-6">
                                    <div class="flex items-center">
                                        <a href="${pageContext.request.contextPath}/tasks/update?projectId=<%= task.getProject().getProjectId() %>&taskId=<%= task.getTaskId() %>">edit</a>
                                        <form action="${pageContext.request.contextPath}/tasks/delete?projectId=<%= task.getProject().getProjectId() %>&taskId=<%= task.getTaskId() %>"
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