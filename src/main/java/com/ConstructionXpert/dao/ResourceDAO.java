package com.ConstructionXpert.dao;

import com.ConstructionXpert.model.Resource;

import java.util.ArrayList;
import java.util.List;

public class ResourceDAO extends ConnectToDb {

    public ResourceDAO () {}

    public List<Resource> listResources (int adminId) {
        List<Resource> resources = new ArrayList<>();

        return resources;
    }

}
