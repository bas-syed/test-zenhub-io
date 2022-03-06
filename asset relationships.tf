// Basic Attribute Type
resource "highbond_attribute_type" "att-description" {
  name         = "description"
  display_name = "Description"
  data_type    = "text"
  is_global    = true
  is_required  = false
  tooltip      = "Just a description"
}

// Create an asset type with no workflow
resource "highbond_asset_type" "ast-test-0" {
  name         = "Test Asset 0"
  description  = "Add a description here later"
  display_name = "Test Asset"
  attribute_ids = [33, highbond_attribute_type.att-description.id]
}

// Create an risk asset type with now workflow
resource "highbond_asset_type" "ast-test-1" {
  name         = "Test Asset 1"
  description  = "Add a description here later"
  display_name = "Test Asset"
  category = "risks"
  attribute_ids = [33,highbond_attribute_type.att-description.id]
}

// Create an control asset type with now workflow
resource "highbond_asset_type" "ast-test-2" {
  name         = "Test Asset 2"
  description  = "Add a description here later"
  display_name = "Test Asset"
  category = "controls"
  attribute_ids = [33, highbond_attribute_type.att-description.id]
}

// Create an objective asset type with now workflow
resource "highbond_asset_type" "ast-test-3" {
  name         = "Test Asset 3"
  description  = "Add a description here later"
  display_name = "Test Asset"
  category = "objectives"
  attribute_ids = [33, highbond_attribute_type.att-description.id]
}

// Adhoc relationship type Attribute type
resource "highbond_attribute_type" "att-adHoc" {
  name         = "links"
  display_name = "Links to Assets"
  data_type    = "adHocRelationship"
  is_global    = true
  is_required  = false
  tooltip      = "Linking Assets"
  type_options {
    labels {
      name = "Causes"
      type = "upstream"
      related_label {
        name = "Caused By"
      }
      permitted_relationships {
        primary_object_type_id   = highbond_asset_type.ast-test-3.id
        secondary_object_type_id = highbond_asset_type.ast-test-2.id
      }
    }
    labels {
      name = "Caused By"
      type = "downstream"
      related_label {
        name = "Causes"
      }
    }
  }
}

//Showing Adhoc relationship type on Assets
resource "highbond_asset_type_attribute" "att-adhoc-control" {
  asset_type_id     = highbond_asset_type.ast-test-2.id
  attribute_type_id = highbond_attribute_type.att-adHoc.id
}

resource "highbond_asset_type_attribute" "att-adhoc-objective" {
  asset_type_id     = highbond_asset_type.ast-test-3.id
  attribute_type_id = highbond_attribute_type.att-adHoc.id
}