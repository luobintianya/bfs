<!DOCTYPE html>
<html class=no-js ng-app=codisControllers>
<head>
    <meta charset=utf-8>
    <title>Codis</title>
    <style type=text/css>.panel-heading {
        overflow: hidden;
        padding-top: 20px;
    }

    .btn-group {
        position: relative;
    }

    td {
        vertical-align: middle !important;
    }

    .control-label {
        padding-top: 0;
        padding-bottom: 5px;
    }

    .modal-body {
        padding-top: 5px !important;
    }</style>
    <meta name=description content="">
    <meta name=viewport content="width=device-width">
    <link rel="shortcut icon" href=/6df2b309.favicon.ico>
    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <link rel=stylesheet href=styles/b5495e1f.vendor.css>
    <link rel=stylesheet href=styles/a1b6bacd.main.css>
<body> <!--[if lt IE 10]>
<p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.</p>
<![endif]-->
<script type=text/ng-template id=addServerToGroupModal>
    <div
    class="modal-header">
    <h4 class="modal-title">Add Server To Group</h4>
    </div>
    <div class="modal-body">
        <form novalidate="novalidate" class="form-horizontal">
            <input type="hidden" ng-model="server.group_id" ng-value="server.group_id"/>

            <div class="control-group">
                <label class="control-label">Server Addr:</label>

                <div class="controls">
                    <input class="form-control" type="text" ng-model="server.addr"/>
                </div>
            </div>
        </form>
    </div>
    <div class="modal-footer">
        <button class="btn btn-default" ng-click="ok(server)">OK</button>
        <button class="btn btn-warning" ng-click="cancel()">Cancel</button>
    </div></script>
<script type=text/ng-template id=slotRangeSetModal>
    <div
    class="modal-header">
    <h4 class="modal-title">Set Server Group to Slot(s)</h4>
    </div>
    <div class="modal-body">
        <form novalidate="novalidate" class="form-horizontal">
            <div class="control-group">
                <label class="control-label">Slot From</label>

                <div class="controls">
                    <input class="form-control" type="number" ng-model="task.from"/>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label">Slot To</label>

                <div class="controls">
                    <input class="form-control" type="number" ng-model="task.to"/>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label">New Group Id</label>

                <div class="controls">
                    <input class="form-control" type="number" ng-model="task.new_group"/>
                </div>
            </div>

        </form>
    </div>
    <div class="modal-footer">
        <button class="btn btn-default" ng-click="ok(task)">OK</button>
        <button class="btn btn-warning" ng-click="cancel()">Cancel</button>
    </div></script>
<script type=text/ng-template id=migrateModal>
    <div
    class="modal-header">
    <h4 class="modal-title">Migrate Slot(s)</h4>
    </div>
    <div class="modal-body">
        <form novalidate="novalidate" class="form-horizontal">
            <div class="control-group">
                <label class="control-label">Slot From</label>

                <div class="controls">
                    <input class="form-control" type="number" ng-model="task.from"/>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label">Slot To</label>

                <div class="controls">
                    <input class="form-control" type="number" ng-model="task.to"/>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label">Migrate to (Group Id)</label>

                <div class="controls">
                    <input class="form-control" type="number" ng-model="task.new_group"/>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label">Migrate Key Delay (MS)</label>

                <div class="controls">
                    <input class="form-control" type="number" ng-model="task.delay"/>
                </div>
            </div>

        </form>
    </div>
    <div class="modal-footer">
        <button class="btn btn-default" ng-click="ok(task)">OK</button>
        <button class="btn btn-warning" ng-click="cancel()">Cancel</button>
    </div></script>
<script type=text/ng-template id=newServerGroupModal>
    <div
    class="modal-header">
    <h4 class="modal-title">New Server Group</h4>
    </div>
    <div class="modal-body">
        <form novalidate="novalidate" class="form-horizontal">
            <div class="control-group">
                <label class="control-label">Server Group Id (1,2,3,4,5...):</label>

                <div class="controls">
                    <input class="form-control" type="number" ng-model="group.id"/>
                </div>
            </div>
        </form>
    </div>
    <div class="modal-footer">
        <button class="btn btn-default" ng-click="ok(group)">OK</button>
        <button class="btn btn-warning" ng-click="cancel()">Cancel</button>
    </div></script> <!-- contents -->
<div class="navbar navbar-default navbar-static-top" role=navigation>
    <div class=container>
        <div class=navbar-header><a class=navbar-brand href=#>Codis</a></div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href=/slots target=_blank>Slots</a></li>
            </ul>
        </div>
    </div>
</div>
<div class=container> <!-- Server Groups -->
    <div ng-controller=codisOverviewCtl ng-cloak>
        <div class=row>
            <div class=col-md-4>
                <h4> Overview
                    <button ng-click=refresh() class="btn btn-default btn-sm"><span
                            class="glyphicon glyphicon-refresh"></span></button>
                </h4>
                <table class="table table-bordered">
                    <tbody>
                    <tr>
                        <td> Product Name:
                        <td><b>[[ product ]]</b>
                    <tr>
                        <td> Keys:
                        <td> [[ keys ]]
                    <tr>
                        <td> Mem Used:
                        <td> [[ memUsed ]] MB
                    <tr>
                        <td> Performace:
                        <td> [[ ops ]] OP/s
                </table>
            </div>
            <div class=col-md-8>
                <highchart config=chartOps></highchart>
            </div>
        </div>
    </div>
    <div ng-controller=codisServerGroupMainCtl ng-cloak>
        <div class=row>
            <div class=col-md-12>
                <h4> Server Groups
                    <button ng-click=refresh() class="btn btn-default btn-sm"><span
                            class="glyphicon glyphicon-refresh"></span></button>
                </h4>
                <p>
                    <button class="btn btn-sm btn-default" ng-click=addServerGroup()><span
                            class="glyphicon glyphicon-plus"></span> New Server Group
                    </button>
                </p>
            </div>
        </div>
        <div class=row>
            <div class=col-md-12>
                <div class="panel panel-default" ng-repeat="group in server_groups | orderBy:'id'">
                    <div class=panel-heading><b>group_[[ group.id ]]</b>

                        <div class="btn-group btn-group-sm pull-right">
                            <button class="btn btn-sm btn-primary" ng-click=addServer(group.id)
                                    title="Add Redis Server"><span class="glyphicon glyphicon-plus"></span> Add New
                                Redis Instance
                            </button>
                            <button class="btn btn-sm btn-default btn-danger" ng-click=removeServerGroup(group.id)><span
                                    class="glyphicon glyphicon-remove"></span></button>
                        </div>
                    </div>
                    <div class=panel-body>
                        <table class="table table-bordered" ng-if="group.servers.length > 0">
                            <thead>
                            <tr>
                                <th> Addr
                                <th> Type
                                <th> Mem Used
                                <th> Keys
                                <th>
                            <tbody>
                            <tr ng-repeat="server in group.servers | orderBy:'type'" ng-controller=redisCtl>
                                <td> [[ server.addr ]]
                                <td> [[ server.type ]]
                                <td> [[ serverInfo.used_memory_human ]] / [[ serverInfo.maxmemory / (1024 * 1024 *
                                    1024.0) ]] GB
                                <td> [[ serverInfo.db0 ]]
                                <td>
                                    <div class="btn-group btn-group-sm pull-right"><a class="btn btn-primary btn-sm"
                                                                                      ng-if="server.type != 'master'"
                                                                                      href=""
                                                                                      ng-click=promoteServer(server)>
                                        <span class="glyphicon glyphicon-arrow-up"></span> Promote to Master</a> <a
                                            class="btn btn-danger btn-sm" href="" ng-click=removeServer(server)><span
                                            class="glyphicon glyphicon-remove"></span></a></div>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div ng-controller=codisSlotCtl ng-cloak>
        <div class=row>
            <div class=col-md-12><h4> Slot Control </h4>

                <p>

                <div class="btn-group btn-group-sm">
                    <button class="btn btn-sm btn-danger" ng-click=rangeSet()><span
                            class="glyphicon glyphicon-pencil"></span> Range Set (set new Group)
                    </button>
                    <a class="btn btn-sm btn-default" href=/slots><span class="glyphicon glyphicon-eye-open"></span>
                        Slots Status </a></div>
                </p> </div>
        </div>
    </div>
    <div ng-controller=codisMigrateCtl ng-cloak>
        <div class=row>
            <div class=col-md-12>
                <h4> Migrate Status
                    <button ng-click=refresh() class="btn btn-default btn-sm"><span
                            class="glyphicon glyphicon-refresh"></span></button>
                </h4>
                <p>

                <div class="btn-group btn-group-sm">
                    <button class="btn btn-default btn-sm btn-success" ng-click=rebalance()><span
                            class="glyphicon glyphicon-th-large"></span> Auto Rebalance
                    </button>
                    <button class="btn btn-default btn-sm" ng-click=migrate()><span
                            class="glyphicon glyphicon-plane"></span> Migrate Slot(s)
                    </button>
                </div>
                </p>
                <table class="table table-bordered" ng-if="migrate_tasks.length>0"><h5 class=text-muted> Migrate Task
                    Info </h5>
                    <thead>
                    <tr>
                        <th>Migrate Slot
                        <th>New Group
                        <th>Create At
                        <th>Status
                        <th>Percent
                    <tbody>
                    <tr ng-repeat="task in migrate_tasks">
                        <td> slot_[[ task.slot_id ]]
                        <td> group_[[ task.new_group ]]
                        <td> [[ task.create_at * 1000| date:'yyyy-MM-dd HH:mm:ss Z']]
                        <td> [[ task.status]]
                        <td> [[ task.percent ]] %
                </table>
                <table ng-if="migrate_status.migrate_slots.length > 0" class="table table-bordered"><h5
                        ng-if="migrate_status.migrate_slots.length > 0" class=text-muted> Migrating Slot Info </h5>
                    <thead>
                    <tr>
                        <th>Slot Id
                        <th>Current Owner Group
                        <th>Migrate From
                        <th>Migrate To
                        <th>Remain Keys
                    <tbody>
                    <tr ng-repeat="slot in migrate_status.migrate_slots" ng-controller=slotInfoCtl>
                        <td> slot_[[ slot.id ]]
                        <td> group_[[ slot.group_id ]]
                        <td> [[slot.state.migrate_status.from ]]
                        <td> [[slot.state.migrate_status.to ]]
                        <td> [[ slotInfo.keys ]]
                </table>
            </div>
        </div>
    </div>
    <div ng-controller=codisProxyCtl ng-cloak>
        <div class=row>
            <div class=col-md-12>
                <h4> Proxy Status
                    <button ng-click=refresh() class="btn btn-default btn-sm"><span
                            class="glyphicon glyphicon-refresh"></span></button>
                </h4>
                <table ng-if="proxies.length > 0" class="table table-bordered">
                    <tbody>
                    <thead>
                    <tr>
                        <th>Proxy Name
                        <th>Proxy Addr
                        <th>Proxy DebugVars Addr
                        <th>Proxy Status
                        <th>
                    <tr ng-repeat="proxy in proxies">
                        <td><p>[[proxy.id]]</p>
                        <td> [[proxy.addr]]
                        <td><a href=http://[[proxy.debug_var_addr]]/debug/vars
                               target=_blank>[[proxy.debug_var_addr]]</a>
                        <td ng-switch=proxy.state><span class="label label-success" ng-switch-when=online> [[proxy.state]] </span>
                            <span class="label label-default" ng-switch-default> [[proxy.state]] </span>
                        <td>
                            <button class="btn btn-default" ng-click="setStatus(proxy, 'online')">Mark Online</button>
                            <button class="btn btn-danger" ng-click="setStatus(proxy, 'mark_offline')">Mark Offline
                            </button>
                </table>
                <h5 ng-if="proxies.length ==0" class=text-muted>No proxies</h5></div>
        </div>
    </div>
</div>
<script src=scripts/1e5b706e.vendor.js></script>
<script src=scripts/dea5e6a4.main.js></script>
