
if exists (select Name from sys.indexes where Name = 'n_idx_Campaigns')
	drop index n_idx_Campaigns on Campaigns

select * from CampaignsView

create nonclustered index n_idx_Campaigns on Campaigns(Substance)

select * from CampaignsView

if exists (select Name from sys.indexes where Name = 'n_idx_Pharmacists')
	drop index n_idx_Pharmacists on Pharmacists

select * from PharmacistsView

create nonclustered index n_idx_Pharmacists on Pharmacists(Studies)

select * from PharmacistsView