/*
 * RHQ Management Platform
 * Copyright (C) 2005-2010 Red Hat, Inc.
 * All rights reserved.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation version 2 of the License.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 */

package org.rhq.helpers.perftest.support.jpa.mapping;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

import org.rhq.helpers.perftest.support.jpa.ColumnValues;

/**
 *
 * @author Lukas Krejci
 */
public class ColumnValuesTableMap extends HashMap<String, Set<ColumnValues>> {

    private static final long serialVersionUID = 1L;

    public Set<ColumnValues> getOrCreate(Object key) {
        Set<ColumnValues> ret = super.get(key);
        if (ret == null) {
            ret = new HashSet<ColumnValues>();
            put((String)key, ret);
        }
        
        return ret;
    }
}
