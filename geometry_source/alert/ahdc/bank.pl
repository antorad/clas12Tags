use strict;
use warnings;

our %configuration;


# Variable Type is two chars.
# The first char:
#  R for raw integrated variables
#  D for dgt integrated variables
#  S for raw step by step variables
#  M for digitized multi-hit variables
#  V for voltage(time) variables
#
# The second char:
# i for integers
# d for doubles

sub define_ahdc_bank
{
	my $bankname = shift;
	my $bankId   = shift;
	
	# uploading the hit definition
#	insert_bank_variable(\%configuration, $bankname, "bankid",   $bankId, "Di", "$bankname bank ID");
#	insert_bank_variable(\%configuration, $bankname, "superlayer",         1, "Di", "superlayer number from 0 to 4, circles in XY");
#	insert_bank_variable(\%configuration, $bankname, "layer",          2, "Di", "layer number (0 or 1)");
#	insert_bank_variable(\%configuration, $bankname, "wire",         3, "Di", "the AHDC cell number, from 1!");
#	insert_bank_variable(\%configuration, $bankname, "doca",            4, "Dd", "DOCA in mm");
#	insert_bank_variable(\%configuration, $bankname, "subcell",            5, "Di", "subcell 1 or 2, right or left of the signal wire");
#	insert_bank_variable(\%configuration, $bankname, "adc_energy",            6, "Dd", "ADC energy in MeV");
#	insert_bank_variable(\%configuration, $bankname, "wire_energy",            7, "Dd", "wire deposited energy in MeV");
#	insert_bank_variable(\%configuration, $bankname, "totEdep_MC",            8, "Dd", "MC truth totEdep in MeV");
#	insert_bank_variable(\%configuration, $bankname, "signal" ,           9, "Dd", "signal");
#	insert_bank_variable(\%configuration, $bankname, "time" ,           10, "Dd", "time");
#	insert_bank_variable(\%configuration, $bankname, "hitn",          99, "Di", "hit number");


	insert_bank_variable(\%configuration, $bankname, "bankid",   $bankId, "Di", "$bankname bank ID");
	insert_bank_variable(\%configuration, $bankname, "sector",       1, "Di", "set to 1");
	insert_bank_variable(\%configuration, $bankname, "layer",        2, "Di", "hipo layer is superlayer*10 + layer");
	insert_bank_variable(\%configuration, $bankname, "component",    3, "Di", "wire number");
	insert_bank_variable(\%configuration, $bankname, "ADC_order",    4, "Di", "set to 1");
	insert_bank_variable(\%configuration, $bankname, "ADC_ADC",      5, "Di", "ADC integral from pulse fit - currently set to adcMax");
	insert_bank_variable(\%configuration, $bankname, "ADC_time" ,    6, "Dd", "time of the max ADC over the pulse");
	insert_bank_variable(\%configuration, $bankname, "ADC_ped" ,     7, "Di", "pedestal from pulse analysis - currently set to noise level");

	insert_bank_variable(\%configuration, $bankname, "WF_timestamp", 14, "Dl", "Hardware Timestamp");
	for my $itr (1..30) {
		my $entry = "wf_s$itr";
		insert_bank_variable(\%configuration, $bankname, $entry,$itr+14, "Di", "ADC sample $itr");
	}
        insert_bank_variable(\%configuration, $bankname, "WF_time", 79, "Di", "for fine time correction");
	insert_bank_variable(\%configuration, $bankname, "hitn", 199, "Di", "hit number");

	

}


sub define_banks {
	define_ahdc_bank("ahdc", 22400);
#	define_myatof_bank("myatof", 2500);
}

