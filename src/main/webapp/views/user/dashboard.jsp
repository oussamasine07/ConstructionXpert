<%@ page import="com.ConstructionXpert.model.*, java.util.*, java.text.*" %>
<%

    DecimalFormatSymbols symbols = new DecimalFormatSymbols();
    symbols.setGroupingSeparator('.');
    symbols.setDecimalSeparator(',');
    DecimalFormat df = new DecimalFormat("#,###.00", symbols);

    String totalSpent = df.format((Double) request.getAttribute("totalSpent"));
    int countProjects = (Integer) request.getAttribute("countProjects");
    int coutResources = (Integer) request.getAttribute("coutResources");


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



</div>

<jsp:include page="/views/parcials/footer.jsp"/>